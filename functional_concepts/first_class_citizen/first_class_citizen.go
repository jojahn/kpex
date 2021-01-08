package main

func greet() string {
	return "Hello, World!" 
}

func main() {
	var increment func(int) int = func (a int) int {
		return a + 1
	}
	increment(1) // == 2
	var g = greet
	g()
}