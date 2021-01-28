defmodule OrderApiWeb.ParseController do
  use OrderApiWeb, :controller
  alias OrderApi.Services.Solicit

  def index(conn, _params) do
    Solicit.run()
    |> case do
      {:ok, response} ->
        conn
        |> put_status(:ok)
        |> json(%{message: Jason.decode!(response.request.body)})

      {:error, _reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: "Parse cannot be sent"})
    end
  end
end
