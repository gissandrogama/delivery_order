defmodule OrderApi.Buyer do
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.{BillingInfos, Phone, Order}

  schema "buyers" do
    field :email, :string
    field :external_code, :integer
    field :first_name, :string
    field :last_name, :string
    field :nickname, :string
    has_many :phones, Phone
    has_many :ordes, Order
    has_one :billing_infos, BillingInfos

    timestamps()
  end

  @doc false
  def changeset(buyer, attrs) do
    buyer
    |> cast(attrs, [:last_name, :first_name, :external_code, :email, :nickname])
    |> cast_assoc(:phones, with: &Phone.changeset/2)
    |> cast_assoc(:billing_infos, with: &BillingInfos.changeset/2)
    |> cast_assoc(:orders, with: &Order.changeset/2)
    |> validate_required([:last_name, :first_name, :external_code, :email, :nickname])
  end
end
