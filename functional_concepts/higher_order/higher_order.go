package main

import "fmt"

func multiplyBy(n int) func(int) int {
	return func(x int) int {
		return n * x
	}
}

func main() {
	multiplyBy5 := multiplyBy(5)
	fmt.Printf("multiplyBy5(2) == %d", multiplyBy5(2))
}
