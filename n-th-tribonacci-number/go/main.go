package main

import "fmt"

func tribonacci(n int) int {

}

func main() {
	cases := []Case{
		{4, 4},
		{25, 1389537},
	}

	for _, c := range cases {
		r := tribonacci(c.input)
		if r != c.output {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	input  int
	output int
}
