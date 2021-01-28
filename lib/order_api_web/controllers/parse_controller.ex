defmodule OrderApiWeb.ParseController do
  use OrderApiWeb, :controller

  def index(conn, _params) do
    OrderApi.Services.Solicit.run()
    |> case do
      {:ok, response} ->
        conn
        |> put_status(:ok)
        |> json(%{message: Jason.decode!(response.request.body)})

      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: reason})
    end
  end
end
