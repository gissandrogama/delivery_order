defmodule OrderApi.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :area_code, :integer
      add :number, :string
      add :buyer_id, references(:buyers, on_delete: :nilify_all)

      timestamps()
    end

    create index(:phones, [:buyer_id])
  end
end
