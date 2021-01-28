defmodule OrderApi.Repo.Migrations.CreateCitys do
  use Ecto.Migration

  def change do
    create table(:citys) do
      add :name, :string
      add :receiver_address_id, references(:receiver_address, on_delete: :nilify_all)

      timestamps()
    end

    create index(:citys, [:receiver_address_id])
  end
end
