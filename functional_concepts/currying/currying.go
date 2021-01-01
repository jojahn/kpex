package main

import "fmt"

func multiply(a int, b int) int {
	return a * b
}

func multiplyC(a int) func(int) int {
	return func(b int) int {
		return a * b
	}
}

func main() {
	fmt.Printf("multiply(2, 2) = %d\n", multiply(2, 2))
	fmt.Printf("multiplyC(2)(2) = %d", multiplyC(2)(2))
}