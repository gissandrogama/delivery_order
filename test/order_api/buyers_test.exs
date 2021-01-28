defmodule OrderApi.BuyersTest do
  use OrderApi.DataCase

  import OrderApi.PayloadFixture

  alias OrderApi.Buyers

  describe "run/0" do
    test "return structure in json" do
      build()
      result = Buyers.list_buyers()
      assert [%OrderApi.Buyer{}] = result
    end
  end
end
