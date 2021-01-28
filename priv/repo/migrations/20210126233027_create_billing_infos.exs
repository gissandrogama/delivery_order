defmodule OrderApi.Repo.Migrations.CreateBillingInfos do
  use Ecto.Migration

  def change do
    create table(:billing_infos) do
      add :doc_number, :string
      add :doc_type, :string
      add :buyer_id, references(:buyers, on_delete: :nilify_all)

      timestamps()
    end

    create index(:billing_infos, [:buyer_id])
  end
end
