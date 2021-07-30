defmodule SweaterTest do
  use ExUnit.Case
  doctest Sweater

  test "greets the world" do
    assert Sweater.hello() == :world
  end
end
