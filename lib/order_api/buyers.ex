defmodule OrderApi.Buyers do
  @moduledoc """
  module has functions that retrieve a buyers, insert in the bank
  """

  import Ecto.Query, warn: false
  alias OrderApi.{Buyer, Repo}

  @doc """
  function returns `buyers` with preload of` orders`, `phones` and` billings_infos`


  ## Example

       iex> list_buyer()
       [%Buyer{}, ...]


  """
  def list_buyers do
    Repo.all(Buyer)
    |> Repo.preload([:orders, :phones, :billing_infos])
  end

  def create_buyer(attrs \\ %{}) do
    %Buyer{}
    |> Buyer.changeset(attrs)
    |> Repo.insert()
  end
end
