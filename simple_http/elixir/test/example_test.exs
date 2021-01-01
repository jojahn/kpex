defmodule SimpleHttpTest do
  use ExUnit.Case
  doctest SimpleHttp

  test "greets the world" do
    assert SimpleHttp.hello() == :world
  end
end
