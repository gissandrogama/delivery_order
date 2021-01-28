defmodule OrderApi.Services.Solicit do
  @moduledoc """
  this module has a function that creates a structure to be sent to an api
  """
  @url "https://delivery-center-recruitment-ap.herokuapp.com/"

  alias OrderApi.Services.Process

  @doc """
  The function `run / 0` receives a data structure in json, and makes a request of type post
  to the api at that address `"https://delivery-center-recruitment-ap.herokuapp.com/"`.


  ## Example


       iex> Solicit.run()
       {:ok, %HTTPoison.Response{}}
  """
  def run() do
    headers = [{"X-Sent", "22h07 - 27/01/21"}, {"Content-Type", "application/json"}]

    body = Process.structure()

    HTTPoison.post(@url, body, headers)
  end
end
