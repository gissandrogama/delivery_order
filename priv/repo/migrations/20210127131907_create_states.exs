defmodule OrderApi.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :name, :string
      add :receiver_address_id, references(:receiver_address, on_delete: :nilify_all)

      timestamps()
    end

    create index(:states, [:receiver_address_id])
  end
end
