defmodule Insert do
  alias OrderApi.Repo
  alias OrderApi.Buyer

  def build() do
    read()
  end

  # def build_order(payments) do
  #   payments
  #   |> Enum.group_by(& &1["payments"], &Map.delete(&1, "payments"))
  # end

  # # def insert(customer) do
  # #   %Customer{}
  # #   |> Customer.changeset(customer)
  # #   |> Repo.insert()
  # # end

  def get_buyer() do
    buyer =
      read()
      |> Map.get("buyer")

    buyer
    |> Map.put("external_code", buyer["id"])
    |> Map.delete("id")
  end

  def build_buyer() do
    phone = Map.get(get_buyer(), "phone")
    billing = Map.get(get_buyer(), "billing_info")

    get_buyer()
    |> Map.delete("phone")
    |> Map.delete("billing_info")
    |> Map.put("phones", [phone])
    |> Map.put("billing_infos", billing)
    |> Map.put("orders", [get_order])
    |> insert_buyer()
  end

  def insert_buyer(buyer) do
    IO.inspect(buyer)

    %Buyer{}
    |> Buyer.changeset(buyer)
    |> Repo.insert()
  end

  # def get_shipping() do
  #   read()
  #   |> Map.get("shipping")
  # end

  # def get_payments() do
  #   read()
  #   |> Map.get("payments")
  #   |> Enum.fetch!(0)
  # end

  def get_items() do
    read()
    |> Map.get("order_items")
    |> Enum.group_by(& &1["item"], &Map.delete(&1, "item"))
    |> Map.to_list()
  end

  def get_order() do
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
  end

  def read() do
    "payload.json"
    |> File.read!()
    |> Jason.decode!()
  end
end

Insert.get_order()
|> IO.inspect()

# def parser() do
#   buyer = get_buyer()
#   shipping = get_shipping()
#   payments = get_payments()
#   items = get_items()
#   order = get_order()

#   [
#     %{
#       "external_code" => order["id"],
#       "store_id" => order["store_id"],
#       "sub_total" => order["total_amount"],
#       "delivery_free" => order["total_shipping"],
#       "total" => order["total_amount_with_shipping"],
#       "country" => shipping["receiver_address"]["country"]["id"],
#       "state" => shipping["receiver_address"]["state"]["name"],
#       "city" => shipping["receiver_address"]["city"]["name"],
#       "district" => shipping["receiver_address"]["neighborhood"]["name"],
#       "street" => shipping["receiver_address"]["street_name"],
#       "complement" => "galpao",
#       "latitude" => shipping["receiver_address"]["latitude"],
#       "longitude" => shipping["receiver_address"]["longitude"],
#       "dt_order_create" => order["date_created"],
#       "postal_code" => shipping["receiver_address"]["zip_code"],
#       "total_shipping" => order["total_shipping"],
#       "number" => "0",
#       "items" => %{
#           "external_code" => items["item"]["id"],
#           "name" => items["item"]["title"],
#           "price" => items["unit_price"],
#           "quantity" => items["quantity"],
#           "total" => items["full_unit_price"]
#         }
#       ,
#       "payments" => %{"type" => payments["payment_type"], "value" => payments["total_paid_amount"]},
#       "customer" => %{
#         "external_code" => "#{buyer["id"]}",
#         "name" => buyer["nickname"],
#         "email" => buyer["email"],
#         "contact" => "#{buyer["phone"]["area_code"]}#{buyer["phone"]["number"]}"
#       }
#     }
#   ]
# end
