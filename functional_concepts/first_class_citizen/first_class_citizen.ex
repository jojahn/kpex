increment = fn x -> x + 1 end
IO.puts "increment.(1) == #{increment.(1)}"

defmodule Greeter do
    def greet(subject, body) do
        "#{subject}\n#{body}"
    end
end

g = &Greeter.greet/2

IO.puts g.("World", "Here is Elixir")