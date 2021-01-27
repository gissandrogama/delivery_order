defmodule OrderApi.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.{Buyer, Payment}

  schema "orders" do
    field :date_closed, :string
    field :date_created, :string
    field :delivery_fee, :decimal
    field :expiration_date, :string
    field :external_code, :integer
    field :last_updated, :string
    field :paid_amount, :decimal
    field :status, :string
    field :store_id, :integer
    field :total_amount, :decimal
    field :total_amount_with_shipping, :decimal
    field :total_shipping, :decimal
    belongs_to :buyer, Buyer
    has_one :payment, Payment

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :external_code,
      :store_id,
      :date_created,
      :date_closed,
      :last_updated,
      :total_amount,
      :delivery_fee,
      :total_amount_with_shipping,
      :paid_amount,
      :expiration_date,
      :total_shipping,
      :status,
      :buyer_id
    ])
    |> foreign_key_constraint(:buyer_id)
    |> cast_assoc(:payment, with: &Payment.changeset/2)
    |> validate_required([
      :external_code,
      :store_id,
      :date_created,
      :date_closed,
      :last_updated,
      :total_amount,
      :delivery_fee,
      :total_amount_with_shipping,
      :paid_amount,
      :expiration_date,
      :total_shipping,
      :status
    ])
  end
end
