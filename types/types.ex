# Types
# https://hexdocs.pm/elixir

# Basic Types
string = "Hello, World!"
string = "Hello, #{:world}"
bool = false || true
integer = 1
float = 1.0
atom = :atom
regex = ~r/\d+/
date = ~D[2020-08-11]
time = ~T[23:00:07.001]

# List, Maps and Tuples
list = [1, 2, 3]
list = list ++ [4]
list = list -- [2]
map = %{"hello" => "world"}
element = map["hello"]
tuple = {:red, :green, :blue}

# Functions
add = fn a, b -> a + b end
add.(1, 1)

# Modules
defmodule Greeter do
    @type receiver :: String
    @type message :: String

    @spec greet(receiver, message) :: String
    def greet(receiver, message) do
        combine_greeting(receiver, message)
    end

    # Private Function
    defp combine_greeting(receiver, message) do
        "Hello, #{receiver}\n#{message}"
    end
end

Greeter.greet(:World, "Here is Elixir")
