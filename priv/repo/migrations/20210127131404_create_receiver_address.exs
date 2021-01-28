defmodule OrderApi.Repo.Migrations.CreateReceiverAddress do
  use Ecto.Migration

  def change do
    create table(:receiver_address) do
      add :address_line, :string
      add :comment, :string
      add :latitude, :decimal
      add :longitude, :decimal
      add :receiver_phone, :string
      add :street_name, :string
      add :street_number, :string
      add :zip_code, :string
      add :external_code, :integer
      add :shipping_id, references(:shippings, on_delete: :nilify_all)

      timestamps()
    end

    create index(:receiver_address, [:shipping_id])
  end
end
