multiplyBy = fn n ->
    fn x -> n * x end
end

multiplyBy5 = multiplyBy.(5)

IO.puts "multiplyBy5(2) == #{multiplyBy5(2)}"
