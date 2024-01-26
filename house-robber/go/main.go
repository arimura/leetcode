package main

import "fmt"

func rob(nums []int) int {

}

func main() {
	cases := []Case{
		{[]int{1, 2, 3, 1}, 4},
		{[]int{2, 7, 9, 3, 1}, 12},
	}
	for _, c := range cases {
		r := rob(c.in)
		if r != c.out {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	in  []int
	out int
}
