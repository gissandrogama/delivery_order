defmodule OrderApi.Neighborhood do
  @moduledoc """
  table bank schema neighborhoods
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias OrderApi.ReceiverAddress

  schema "neighborhoods" do
    field :code, :string
    field :name, :string
    belongs_to :receiver_address, ReceiverAddress

    timestamps()
  end

  @doc false
  def changeset(neighborhood, attrs) do
    neighborhood
    |> cast(attrs, [:code, :name, :receiver_address_id])
    |> foreign_key_constraint(:receiver_address_id)
    |> validate_required([:name])
  end
end
