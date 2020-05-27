package main

import "fmt"

func main() {
	fmt.Printf("5 + 5 = %v", sum(5,5))
}

func sum(num1 int, num2 int) int {
	var result int

	result = num1 + num2

	return result
}
