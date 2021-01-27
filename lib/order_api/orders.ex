defmodule OrderApi.Orders do
  @moduledoc """
  module has functions that retrieve a orders, insert in the bank
  """

  import Ecto.Query, warn: false
  alias OrderApi.{Order, Repo}

  @doc """
  function returns `orders` with preload of `orders`, `phones` and` billings_infos`


  ## Example

       iex> list_buyer()
       [%Buyer{}, ...]


  """
  def list_orders do
    Repo.all(Order)
    |> Repo.preload([:payments, :order_items, :shippings, :buyer])
  end
end
