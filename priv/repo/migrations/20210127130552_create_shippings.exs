defmodule OrderApi.Repo.Migrations.CreateShippings do
  use Ecto.Migration

  def change do
    create table(:shippings) do
      add :date_created, :string
      add :shipment_type, :string
      add :external_code, :decimal
      add :order_id, references(:orders, on_delete: :nilify_all)

      timestamps()
    end

    create index(:shippings, [:order_id])
  end
end
