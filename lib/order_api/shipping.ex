defmodule OrderApi.Shipping do
  @moduledoc """
  table bank schema shippings
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.{Order, ReceiverAddress}

  schema "shippings" do
    field :date_created, :string
    field :external_code, :decimal
    field :shipment_type, :string
    belongs_to :order, Order
    has_one :receiver_address, ReceiverAddress

    timestamps()
  end

  @doc false
  def changeset(shipping, attrs) do
    shipping
    |> cast(attrs, [:date_created, :shipment_type, :external_code, :order_id])
    |> foreign_key_constraint(:order_id)
    |> cast_assoc(:receiver_address, with: &ReceiverAddress.changeset/2)
    |> validate_required([:date_created, :shipment_type, :external_code])
  end
end
