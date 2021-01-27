defmodule OrderApi.Repo.Migrations.CreateNeighborhoods do
  use Ecto.Migration

  def change do
    create table(:neighborhoods) do
      add :code, :string
      add :name, :string
      add :receiver_address_id, references(:receiver_address, on_delete: :nilify_all)

      timestamps()
    end

    create index(:neighborhoods, [:receiver_address_id])
  end
end
