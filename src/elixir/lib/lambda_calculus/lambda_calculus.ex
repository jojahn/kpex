IO.puts("Lambda Calculus")

defmodule LambdaCalculus do
  def t(x) do
    fn(_y) -> x end
  end
end

t = LambdaCalculus.t
f = fn(_x, y) -> y end
i = fn x -> x end
m = fn x -> x.(x) end

# Helper
functions = %{
  "#{Kernel.inspect t}" => "True",
  "#{Kernel.inspect f}" => "False",
  "#{Kernel.inspect i}" => "ID",
  "#{Kernel.inspect m}}" => "M"
}
get_name = fn x -> functions["#{Kernel.inspect x}"] end

# Examples
IO.puts "ID = #{get_name.(i)}"
IO.puts "True = #{get_name.(t)}"
IO.puts "False = #{get_name.(t)}"
IO.puts "ID(True) = #{get_name.(i.(t))}"
IO.puts "ID(False) = #{get_name.(i.(f))}"
IO.puts "ID(ID) = #{get_name.(i.(i))}"
IO.puts "M(ID) = #{get_name.(m.(i))}"
IO.puts "M(True) = #{get_name.(m.(t))}"
# IO.puts "M(M) = #{get_name.(m.(m))}"
