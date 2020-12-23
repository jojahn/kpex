compose = fn f, g -> f.(g) end

square = fn x -> x * x end

compose(square, square)(2) # == 16
compose(square, square)(1) # == 1