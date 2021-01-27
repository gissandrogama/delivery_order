defmodule OrderApi.Services.Process do
  @moduledoc """
  this module has a function that creates a structure to be sent to an api
  """
  alias OrderApi.Orders

  def structure do
    orders = Orders.list_orders()
  end
end
