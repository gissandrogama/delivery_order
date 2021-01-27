defmodule OrderApi.Repo.Migrations.CreateOrderItems do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :full_unit_price, :decimal
      add :quantity, :integer
      add :unit_price, :decimal
      add :order_id, references(:orders, on_delete: :nilify_all)

      timestamps()
    end

    create index(:order_items, [:order_id])
  end
end
