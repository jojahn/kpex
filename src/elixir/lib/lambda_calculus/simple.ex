IO.puts("")

true_fn = fn(x, y) -> return x end
false_fn = fn(x, y) -> return y end

id_fn = fn(x) -> return x end

id_fn(true_fn)