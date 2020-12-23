package main

import (
	"fmt"
	"reflect"
	"runtime"
	"strings"
)

type function func(function) function

func t(x function) function {
	return func(y function) function {
		return x
	}
}

func f(x function) function {
	return func(y function) function {
		return y
	}
}

func i(x function) function {
	return x
}

func m(x function) function {
	return x(x)
}

func a(x function) function {
	return func(y function) function {
		return x(y)(t)
	}
}

func o(x function) function {
	return func(y function) function {
		return x(t)(y)
	}
}

func main() {
	fmt.Printf("ID(True) = %s\n", getFunctionName(i(t)))
	fmt.Printf("ID(False) = %s\n", getFunctionName(i(f)))
	fmt.Printf("ID(ID) = %s\n", getFunctionName(i(i)))
	fmt.Printf("M(ID) = %s\n", getFunctionName(m(i)))
	// fmt.Printf("M(M) = %s\n", getFunctionName(M(M)))

	fmt.Printf("And(True)(False) = %s\n", getFunctionName(a(t)(f)))
	fmt.Printf("And(True)(True) = %s\n", getFunctionName(a(t)(t)))
	fmt.Printf("Or(False)(True) = %s\n", getFunctionName(o(f)(t)))
	fmt.Printf("Or(False)(False) = %s\n", getFunctionName(o(f)(f)))


	fmt.Println()
}

func getFunctionName(function interface{}) string {
	return strings.
		Split(runtime.FuncForPC(
			reflect.ValueOf(function).Pointer()).Name(), ".")[1]
}