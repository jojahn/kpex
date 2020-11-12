import LambdaCalculus

defmodule LambdaCalculusTest do
  use ExUnit.Case
  doctest KPEX

  test "lambda calculus" do
    IO.puts "ID = #{get_name.(i)}"
    IO.puts "True = #{get_name.(t)}"
    IO.puts "False = #{get_name.(t)}"
    IO.puts "ID(True) = #{get_name.(i.(t))}"
    IO.puts "ID(False) = #{get_name.(i.(f))}"
    IO.puts "ID(ID) = #{get_name.(i.(i))}"
    IO.puts "M(ID) = #{get_name.(m.(i))}"
    IO.puts "M(True) = #{get_name.(m.(t))}"
    assert t() == :world
    # IO.puts "M(M) = #{get_name.(m.(m))}"
  end
end
