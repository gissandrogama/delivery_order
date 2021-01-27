defmodule OrderApi.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.{Item, Order}

  schema "order_items" do
    field :full_unit_price, :decimal
    field :quantity, :integer
    field :unit_price, :decimal
    belongs_to :order, Order
    has_one :item, Item

    timestamps()
  end

  @doc false
  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:full_unit_price, :quantity, :unit_price, :order_id])
    |> foreign_key_constraint(:order_id)
    |> cast_assoc(:item, with: &Item.changeset/2)
    |> validate_required([:full_unit_price, :quantity, :unit_price])
  end
end
