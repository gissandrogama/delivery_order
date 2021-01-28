defmodule OrderApi.Services.ProcessTest do
  use OrderApi.DataCase
  doctest Process

  import OrderApi.PayloadFixture

  alias OrderApi.Services.Process

  describe "structure/0" do
    test "return structure in json" do
      build()
      result = Process.structure() |> Jason.decode!()
      assert result["deliveryFee"] == "5.14"
    end
  end
end
