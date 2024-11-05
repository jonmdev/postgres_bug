defmodule PostgresBugTest do
  use ExUnit.Case
  doctest PostgresBug

  test "greets the world" do
    assert PostgresBug.hello() == :world
  end
end
