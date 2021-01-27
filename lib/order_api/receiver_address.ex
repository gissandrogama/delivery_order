defmodule OrderApi.ReceiverAddress do
  use Ecto.Schema
  import Ecto.Changeset
  alias OrderApi.{City, Country, Neighborhood, Shipping, State}

  schema "receiver_address" do
    field :address_line, :string
    field :comment, :string
    field :external_code, :integer
    field :latitude, :decimal
    field :longitude, :decimal
    field :receiver_phone, :string
    field :street_name, :string
    field :street_number, :string
    field :zip_code, :string
    belongs_to :shipping, Shipping
    has_one :state, State
    has_one :city, City
    has_one :country, Country
    has_one :neighborhood, Neighborhood

    timestamps()
  end

  @doc false
  def changeset(receiver_address, attrs) do
    receiver_address
    |> cast(attrs, [
      :address_line,
      :comment,
      :latitude,
      :longitude,
      :receiver_phone,
      :street_name,
      :street_number,
      :zip_code,
      :external_code,
      :shipping_id
    ])
    |> foreign_key_constraint(:shipping_id)
    |> cast_assoc(:state, with: &State.changeset/2)
    |> cast_assoc(:city, with: &City.changeset/2)
    |> cast_assoc(:country, with: &Country.changeset/2)
    |> cast_assoc(:neighborhood, with: &Neighborhood.changeset/2)
    |> validate_required([
      :address_line,
      :comment,
      :latitude,
      :longitude,
      :receiver_phone,
      :street_name,
      :street_number,
      :zip_code,
      :external_code
    ])
  end
end
