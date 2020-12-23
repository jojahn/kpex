package main

import "fmt"

// Basic Types
var boolean bool = false || true
var String string = "Hello, World!"
var integer int = 1
var integer8Bit int8
var integer16Bit int16
var integer32Bit int32
var integer64Bit int64
var unsignedInteger uint

// ...
var Byte byte
var Rune rune // unicode code point
var Float32 float32 = 1.0
var Float64 float64

// Arrays, Slices and Maps
var array [3]int = [3]int{1, 2, 3}
var slice []int = array[0:]
var Map map[string][]int = make(map[string][]int)

// Functions
func add(a int, b int) int {
	return a + b
}

// Structs and Interfaces
type Greeter interface {
	Greet() string
}

type Greeting struct {
	Greeter
	Receiver string
	Message  string
}

func (g *Greeting) Greet() string {
	return fmt.Sprintf("Hello, %s\n%s",
		g.Receiver, g.Message)
}

func main() {
	greeting := Greeting{
		Receiver: "World",
		Message:  "Here is Go",
	}
	greeting.Greet()
}
