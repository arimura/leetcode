package main

import "fmt"

func uniquePaths(m int, n int) int {

}

func main() {
	cases := []Case{
		{
			m:   3,
			n:   7,
			out: 27,
		},
		{
			m:   3,
			n:   2,
			out: 3,
		},
	}
	for _, c := range cases {
		r := uniquePaths(c.m, c.n)
		if r != c.out {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	m   int
	n   int
	out int
}
