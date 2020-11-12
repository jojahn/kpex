package main

import (
	"fmt"
	"reflect"
	"runtime"
	"strings"
)

type Function func(Function) Function

func True(x Function) Function {
	return func(y Function) Function {
		return x
	}
}

func False(x Function) Function {
	return func(y Function) Function {
		return y
	}
}

func ID(x Function) Function {
	return x
}

func M(x Function) Function {
	return x(x)
}

func And(x Function) Function {
	return func(y Function) Function {
		return x(y)(True)
	}
}

func Or(x Function) Function {
	return func(y Function) Function {
		return x(True)(y)
	}
}

func main() {
	fmt.Printf("ID(True) = %s\n", getFunctionName(ID(True)))
	fmt.Printf("ID(False) = %s\n", getFunctionName(ID(False)))
	fmt.Printf("ID(ID) = %s\n", getFunctionName(ID(ID)))
	fmt.Printf("M(ID) = %s\n", getFunctionName(M(ID)))
	// fmt.Printf("M(M) = %s\n", getFunctionName(M(M)))

	fmt.Printf("And(True)(False) = %s\n", getFunctionName(And(True)(False)))
	fmt.Printf("And(True)(True) = %s\n", getFunctionName(And(True)(True)))
	fmt.Printf("Or(False)(True) = %s\n", getFunctionName(Or(False)(True)))
	fmt.Printf("Or(False)(False) = %s\n", getFunctionName(Or(False)(False)))


	fmt.Println()
}

func getFunctionName(function interface{}) string {
	return strings.
		Split(runtime.FuncForPC(
			reflect.ValueOf(function).Pointer()).Name(), ".")[1]
}