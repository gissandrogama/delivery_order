defmodule OrderApi.Country do
  use Ecto.Schema
  import Ecto.Changeset
  alias OrderApi.ReceiverAddress


  schema "countrys" do
    field :code, :string
    field :name, :string
    belongs_to :receiver_address, ReceiverAddress

    timestamps()
  end

  @doc false
  def changeset(country, attrs) do
    country
    |> cast(attrs, [:code, :name, :receiver_address_id])
    |> foreign_key_constraint(:receiver_address_id)
    |> validate_required([:code, :name])
  end
end
