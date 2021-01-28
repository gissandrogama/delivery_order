defmodule OrderApi.OrderItems do
  @moduledoc """
  module has functions that retrieve a orders, insert in the bank
  """

  import Ecto.Query, warn: false
  alias OrderApi.{OrderItem, Repo}

  @doc """
  function returns `order items` with preload of `items`


  ## Example

       iex> list_items()
       [%OrderItem{}, ...]
  """
  def list_items do
    Repo.all(OrderItem)
    |> Repo.preload([:item])
  end
end
