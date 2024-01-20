package main

import "fmt"

func findKthLargest(nums []int, k int) int {

}

func main() {
	cases := []Case{
		{
			[]int{3, 2, 1, 5, 6, 4},
			2,
			5,
		},
		{
			[]int{3, 2, 3, 1, 2, 4, 5, 5, 6},
			4,
			4,
		},
	}
	for _, c := range cases {
		r := findKthLargest(c.nums, c.k)
		if r != c.answear {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	nums    []int
	k       int
	answear int
}
