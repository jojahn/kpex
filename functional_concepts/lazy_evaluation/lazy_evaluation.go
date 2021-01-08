package main

import "fmt"

func main() {
	list := []int{ 1/0, 2, 3 }
	fmt.Println(list)
}