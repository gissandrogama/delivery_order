defmodule OrderApi.Payment do
  @moduledoc """
  table bank schema payments
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.Order

  schema "payments" do
    field :date_approved, :string
    field :date_created, :string
    field :external_code, :integer
    field :installment_amount, :decimal
    field :installments, :integer
    field :order_id, :integer
    field :payer_id, :integer
    field :payment_type, :string
    field :shipping_cost, :decimal
    field :status, :string
    field :taxes_amount, :decimal
    field :total_paid_amount, :decimal
    field :transaction_amount, :decimal
    belongs_to :order_by, Order

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [
      :external_code,
      :order_id,
      :payer_id,
      :installments,
      :payment_type,
      :status,
      :transaction_amount,
      :taxes_amount,
      :shipping_cost,
      :total_paid_amount,
      :installment_amount,
      :date_approved,
      :date_created,
      :order_by_id
    ])
    |> foreign_key_constraint(:order_by_id)
    |> validate_required([
      :external_code,
      :order_id,
      :payer_id,
      :installments,
      :payment_type,
      :status,
      :transaction_amount,
      :taxes_amount,
      :shipping_cost,
      :total_paid_amount,
      :installment_amount,
      :date_approved,
      :date_created
    ])
  end
end
