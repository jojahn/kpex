package main

func main() {
	var increment func(int) int = func (a int) int {
		return a + 1
	}
	increment(1) // == 2
}