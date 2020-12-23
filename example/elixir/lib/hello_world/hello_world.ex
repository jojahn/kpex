defmodule KPEX.HelloWorld do
  @moduledoc false

  use Application
  def start(_type, _args) do
    IO.puts "Hello, World!"
    Task.start(fn -> :timer.sleep(1000); IO.puts("done sleeping") end)
  end
end