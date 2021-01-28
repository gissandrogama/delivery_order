defmodule OrderApi.Services.SolicitTest do
  use OrderApi.DataCase
  
  import OrderApi.PayloadFixture

  alias OrderApi.Services.Solicit

  describe "run/0" do
    test "return structure in json" do
      build()
      {:ok, result} = Solicit.run()
      assert result.status_code == 200
    end
  end
end
