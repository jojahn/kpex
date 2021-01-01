compose = fn f, g ->
  fn value -> f.(g.(value)) end
end

square = fn x -> x * x end

IO.puts "compose(square, square)(2) = #{compose.(square, square).(2)}" # == 16
IO.puts "compose(square, square)(1) = #{compose.(square, square).(1)}" # == 1
