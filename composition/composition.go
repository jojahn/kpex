package main

import "fmt"

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
	fmt.Printf("compose(square, square)(2) = %d\n", compose(square, square)(2))
	fmt.Printf("compose(square, square)(0) = %d", compose(square, square)(0))
}
