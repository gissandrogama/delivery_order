defmodule OrderApiWeb.ParseControllerTest do
  use OrderApiWeb.ConnCase, async: true

  alias OrderApi.PayloadFixture

  describe "index" do
    test "parse was created and accepted by api", %{conn: conn} do
      PayloadFixture.build()
      conn = get(conn, Routes.parse_path(conn, :index))
      assert %{"message" => %{}} = json_response(conn, 200)
    end
  end
end
