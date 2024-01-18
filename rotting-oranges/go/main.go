package main

import "fmt"

func orangesRotting(grid [][]int) int {

}

func main() {
	cases := []Case{
		{
			[][]int{{2, 1, 1}, {1, 1, 0}, {0, 1, 1}},
			4,
		},
	}
	for _, c := range cases {
		r := orangesRotting(c.grid)
		if r != c.output {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	grid   [][]int
	output int
}
