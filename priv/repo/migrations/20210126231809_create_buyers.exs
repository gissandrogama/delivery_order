defmodule OrderApi.Repo.Migrations.CreateBuyers do
  use Ecto.Migration

  def change do
    create table(:buyers) do
      add :last_name, :string
      add :first_name, :string
      add :external_code, :integer
      add :email, :string
      add :nickname, :string

      timestamps()
    end

    create(unique_index(:buyers, [:email]))
  end
end
