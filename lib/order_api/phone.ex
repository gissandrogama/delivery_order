defmodule OrderApi.Phone do
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.Buyer

  schema "phones" do
    field :area_code, :integer
    field :number, :string
    # field :buyer_id, :id
    belongs_to :buyer, Buyer

    timestamps()
  end

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, [:area_code, :number, :buyer_id])
    |> foreign_key_constraint(:buyer_id)
    |> validate_required([:area_code, :number])
  end
end
