defmodule OrderApi.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :external_code, :integer
      add :order_id, :integer
      add :payer_id, :integer
      add :installments, :integer
      add :payment_type, :string
      add :status, :string
      add :transaction_amount, :decimal
      add :taxes_amount, :decimal
      add :shipping_cost, :decimal
      add :total_paid_amount, :decimal
      add :installment_amount, :decimal
      add :date_approved, :string
      add :date_created, :string
      add :order_by_id, references(:orders, on_delete: :nilify_all)

      timestamps()
    end

    create index(:payments, [:order_by_id])
  end
end
