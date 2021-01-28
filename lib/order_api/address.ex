defmodule OrderApi.Address do
  @moduledoc """
  module has functions that retrieve a receive address, insert in the bank
  """

  import Ecto.Query, warn: false
  alias OrderApi.{ReceiverAddress, Repo}

  @doc """
  function returns `address` with preload of `city`, `country`, `neighborhood` and `state`

  ## Example

       iex> list_address()
       [%ReceiverAddress{}]
  """
  def list_address do
    Repo.all(ReceiverAddress)
    |> Repo.preload([:city, :country, :neighborhood, :state])
  end
end
