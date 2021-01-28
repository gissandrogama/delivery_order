defmodule OrderApi.Services.Requisition do
  @moduledoc """
  this module has a function that creates a structure to be sent to an api
  """
  @url "https://delivery-center-recruitment-ap.herokuapp.com/"

  alias OrderApi.Services.Process

  @doc """
  A função `request/0` recebe um estrutura de dados em json, e faz uma requisição do tipo post
  para a api nesse endereço `"https://delivery-center-recruitment-ap.herokuapp.com/"`.

  ## Example

       iex> run()
       {:ok, response}
  """
  def run do
    headers = [{"X-Sent", "22h07 - 27/01/21"}, {"Content-Type", "application/json"}]

    body = Process.structure()

    HTTPoison.post(@url, [body], headers)
  end
end
