# Types
# https://hexdocs.pm/elixir

# Basic
string = "Hello, World!"
string = "Hello, #{:world}"
bool = false || true
integer = 1
float = 1.0
atom = :atom
regex = ~r/\d+/
date = ~D[2020-08-11]
time = ~T[23:00:07.001]
function = fn x -> x end

# List and Maps
list = [1, 2, 3]
list = list ++ [4]
list = list -- [2]

map = %{"hello" => "world"}
element = map["hello"]

tuple = {:red, :green, :blue}

# Module
defmodule CustomModule do
    @type name :: String

    @spec greet(name) :: String
    def greet(x) do
        "Hello, #{x}"
    end
end

CustomModule.greet(:World)