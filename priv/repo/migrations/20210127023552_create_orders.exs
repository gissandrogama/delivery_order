defmodule OrderApi.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :external_code, :integer
      add :store_id, :integer
      add :date_created, :string
      add :date_closed, :string
      add :last_updated, :string
      add :total_amount, :decimal
      add :delivery_fee, :decimal
      add :total_amount_with_shipping, :decimal
      add :paid_amount, :decimal
      add :expiration_date, :string
      add :total_shipping, :decimal
      add :status, :string
      add :buyer_id, references(:buyers, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:buyer_id])
  end
end
