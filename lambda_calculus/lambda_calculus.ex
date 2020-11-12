IO.puts("--- Lambda Calculus ---")

true_fn = fn x ->
  fn _y -> x end
end

false_fn = fn _x ->
  fn y -> y end
end

id = fn x -> x end

m = fn x -> x.(x) end

and_fn = fn x ->
  fn y -> x.(y).(true_fn) end
end

or_fn = fn x ->
  fn y -> x.(true_fn).(y) end
end

# Helper
function_to_key = fn x -> Kernel.inspect x end
functions = %{
  "#{function_to_key.(true_fn)}" => "True",
  "#{function_to_key.(false_fn)}" => "False",
  "#{function_to_key.(id)}" => "ID",
  "#{function_to_key.(m)}" => "M"
}
get_name = fn x -> functions["#{function_to_key.(x)}"] end

# Examples
IO.puts "ID(True) = #{get_name.(id.(true_fn))}"
IO.puts "ID(False) = #{get_name.(id.(false_fn))}"
IO.puts "ID(ID) = #{get_name.(id.(id))}"
IO.puts "M(ID) = #{get_name.(m.(id))}"
IO.puts "True(True)(False) = #{get_name.(true_fn.(true_fn).(false_fn))}"
IO.puts "False(True)(False) = #{get_name.(false_fn.(true_fn).(false_fn))}"
# IO.puts "M(M) = #{get_name.(m.(m))}"
IO.puts "And(True)(False) = #{get_name.(and_fn.(true_fn).(false_fn))}"
IO.puts "And(True)(True) = #{get_name.(and_fn.(true_fn).(true_fn))}"
IO.puts "Or(True)(False) = #{get_name.(or_fn.(true_fn).(false_fn))}"
IO.puts "Or(False)(False) = #{get_name.(or_fn.(false_fn).(false_fn))}"
