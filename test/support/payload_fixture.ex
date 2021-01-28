defmodule OrderApi.PayloadFixture do
  @moduledoc """
  module has functions to read the payload and create a structure to insert the data in the
  database automatically and with the appropriate associations.
  """
  alias OrderApi.Buyers

  def build do
    build_buyer()
    |> Buyers.create_buyer()
  end

  def get_buyer do
    buyer =
      read()
      |> Map.get("buyer")

    buyer
    |> Map.put("external_code", buyer["id"])
    |> Map.delete("id")
  end

  def build_buyer do
    phone = Map.get(get_buyer(), "phone")
    billing = Map.get(get_buyer(), "billing_info")

    get_buyer()
    |> Map.delete("phone")
    |> Map.delete("billing_info")
    |> Map.put("phones", [phone])
    |> Map.put("billing_infos", billing)
    |> Map.put("orders", [get_order()])
  end

  def get_shipping do
    shipping =
      read()
      |> Map.get("shipping")
      |> Map.delete("receiver_address")
      |> Map.put("receiver_address", get_receiver())

    shipping
    |> Map.put("external_code", shipping["id"])
    |> Map.delete("id")
  end

  def get_receiver do
    address =
      read()
      |> Map.get("shipping")
      |> Map.get("receiver_address")

    country =
      address
      |> Map.get("country")
      |> Map.put("code", address["country"]["id"])
      |> Map.delete("id")

    neighborhood =
      address
      |> Map.get("neighborhood")
      |> Map.put("code", address["neighborhood"]["id"])
      |> Map.delete("id")

    address
    |> Map.put("external_code", address["id"])
    |> Map.delete("id")
    |> Map.delete("country")
    |> Map.put("country", country)
    |> Map.delete("neighborhood")
    |> Map.put("neighborhood", neighborhood)
  end

  def get_payments do
    read()
    |> Map.get("payments")
    |> Enum.map(&Map.put(&1, "external_code", &1["id"]))
    |> Enum.map(&Map.delete(&1, "id"))
  end

  def get_items do
    item =
      read()
      |> Map.get("order_items")
      |> Enum.map(&Map.get(&1, "item"))
      |> Enum.map(&Map.put(&1, "external_code", &1["id"]))
      |> Enum.map(&Map.delete(&1, "id"))
      |> Enum.fetch!(0)

    read()
    |> Map.get("order_items")
    |> Enum.map(&Map.delete(&1, "item"))
    |> Enum.map(&Map.put(&1, "item", item))
  end

  def get_order do
    order =
      read()
      |> Map.delete("order_items")
      |> Map.delete("buyer")
      |> Map.delete("payments")
      |> Map.delete("shipping")

    order
    |> Map.put("external_code", order["id"])
    |> Map.put("delivery_fee", order["total_shipping"])
    |> Map.delete("id")
    |> build_order()
  end

  def build_order(order) do
    order
    |> Map.put("payments", get_payments())
    |> Map.put("order_items", get_items())
    |> Map.put("shippings", get_shipping())
  end

  def read do
    "payload.json"
    |> File.read!()
    |> Jason.decode!()
  end
end
