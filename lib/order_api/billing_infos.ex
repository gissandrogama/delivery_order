defmodule OrderApi.BillingInfos do
  @moduledoc """
  table bank schema billing_infos
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias OrderApi.Buyer

  schema "billing_infos" do
    field :doc_number, :string
    field :doc_type, :string
    belongs_to :buyer, Buyer

    timestamps()
  end

  @doc false
  def changeset(billing_infos, attrs) do
    billing_infos
    |> cast(attrs, [:doc_number, :doc_type, :buyer_id])
    |> foreign_key_constraint(:buyer_id)
    |> validate_required([:doc_number, :doc_type])
  end
end
