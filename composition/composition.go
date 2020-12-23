package main

type any interface{}
type function func(any) any

func compose(f, g function) function {
	return func(value any) any {
		return f(g(value))
	}
}

func square(x any) any {
	return x.(int) * x.(int)
}

func main() {
	compose(square, square)(2)
	compose(square, square)(0)
}
