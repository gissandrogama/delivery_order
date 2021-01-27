defmodule OrderApi.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.OrderItem

  schema "items" do
    field :external_code, :string
    field :title, :string
    belongs_to :order_item, OrderItem

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:external_code, :title, :order_item_id])
    |> foreign_key_constraint(:order_item_id)
    |> validate_required([:external_code, :title])
  end
end
