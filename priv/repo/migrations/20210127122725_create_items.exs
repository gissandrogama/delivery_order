defmodule OrderApi.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :external_code, :string
      add :title, :string
      add :order_item_id, references(:order_items, on_delete: :nilify_all)

      timestamps()
    end

    create index(:items, [:order_item_id])
  end
end
