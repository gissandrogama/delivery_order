defmodule OrderApi.City do
  use Ecto.Schema
  import Ecto.Changeset
  alias OrderApi.ReceiverAddress

  schema "citys" do
    field :name, :string
    belongs_to :receiver_address, ReceiverAddress

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :receiver_address_id])
    |> foreign_key_constraint(:receiver_address_id)
    |> validate_required([:name])
  end
end
