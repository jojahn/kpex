IO.puts("--- Lambda Calculus ---")

t = fn x ->
  fn _y -> x end
end

f = fn _x ->
  fn y -> y end
end

i = fn x -> x end

m = fn x -> x.(x) end

a = fn x ->
  fn y -> x.(y).(f) end
end

o = fn x ->
  fn y -> x.(t).(y) end
end

# Helper
function_to_key = fn x -> Kernel.inspect x end
functions = %{
  "#{function_to_key.(t)}" => "True",
  "#{function_to_key.(f)}" => "False",
  "#{function_to_key.(i)}" => "ID",
  "#{function_to_key.(m)}" => "M"
}
get_name = fn x -> functions["#{function_to_key.(x)}"] end

# Examples
IO.puts "ID(True) = #{get_name.(i.(t))}"
IO.puts "ID(False) = #{get_name.(i.(f))}"
IO.puts "ID(ID) = #{get_name.(i.(i))}"
IO.puts "M(ID) = #{get_name.(m.(i))}"
IO.puts "True(True)(False) = #{get_name.(t.(t).(f))}"
IO.puts "False(True)(False) = #{get_name.(f.(t).(f))}"
# IO.puts "M(M) = #{get_name.(m.(m))}"

IO.puts "And(True)(False) = #{get_name.(a.(t).(f))}"
IO.puts "And(False)(True) = #{get_name.(a.(f).(t))}"
IO.puts "And(True)(True) = #{get_name.(a.(t).(t))}"

IO.puts "Or(True)(False) = #{get_name.(o.(t).(f))}"
IO.puts "Or(False)(False) = #{get_name.(o.(f).(f))}"
