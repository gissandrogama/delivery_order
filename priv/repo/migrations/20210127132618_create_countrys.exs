defmodule OrderApi.Repo.Migrations.CreateCountrys do
  use Ecto.Migration

  def change do
    create table(:countrys) do
      add :code, :string
      add :name, :string
      add :receiver_address_id, references(:receiver_address, on_delete: :nilify_all)

      timestamps()
    end

    create index(:countrys, [:receiver_address_id])
  end
end
