increment = fn value -> value + 1 end

apply = fn function, value -> function.(value) end

multiplyC = fn x ->
  fn y -> x * y end
end
