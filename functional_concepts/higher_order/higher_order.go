package main

import "fmt"

func multiplyBy(n int) func(int) int {
	return func(x int) int {
		return n * x
	}
}

type body struct {

}

func a(b func(string) string) func() string {
	var s string = "1"
	var s2 string = "2"
	return func() string {
		return b(s2) + s
	}
}

func b(str string) string {
	return str + "2"
}

func main() {
	c := a(b)
	c()
	multiplyBy5 := multiplyBy(5)
	fmt.Printf("multiplyBy5(2) == %d", multiplyBy5(2))
}
