defmodule OrderApi.State do
  use Ecto.Schema
  import Ecto.Changeset
  alias OrderApi.ReceiverAddress

  schema "states" do
    field :name, :string
    belongs_to :receiver_address, ReceiverAddress

    timestamps()
  end

  @doc false
  def changeset(state, attrs) do
    state
    |> cast(attrs, [:name])
    |> foreign_key_constraint(:receiver_address_id)
    |> validate_required([:name])
  end
end
