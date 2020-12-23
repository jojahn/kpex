package main

func increment(value int) int {
	return value + 1
}

func apply(function func(int) int, value int) {
	function(value)
}

func multiplyC(x int) func(int) int {
	return func(y int) int {
		return y * x
	}
}
