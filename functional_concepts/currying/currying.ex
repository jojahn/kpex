multiply = fn x, y -> x * y end
multiplyC = fn x ->
    fn y -> x * y end
end

IO.puts multiply.(2, 2)
IO.puts multiplyC.(2).(2)