defmodule SweaterTest do
  use ExUnit.Case

  alias Sweater

  test "returns weather recommendations" do
    assert [_ | _] = Sweater.get_weather("Anchorage")
  end

  test "returns error when given input other than a string" do
    assert "Please input your city surrounded by quotation marks." == Sweater.get_weather(999999)
  end

  test "returns error message when city cannot be found" do
    assert "Error getting weather data, please try again." == Sweater.get_weather("OlklahomaaaCity")
  end
end
