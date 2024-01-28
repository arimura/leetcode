package main

import "fmt"

var robMemo []int
var noRobMemo []int

func rob(nums []int) int {
	robMemo = make([]int, len(nums))
	for i := range robMemo {
		robMemo[i] = -1
	}
	noRobMemo = make([]int, len(nums))
	for i := range noRobMemo {
		noRobMemo[i] = -1
	}
	return rec(0, false, nums)
}

func rec(i int, prevRob bool, nums []int) int {
	if prevRob {
		return rec(i+1, false, nums)
	}
	if len(nums) <= i {
		return 0
	}
	if len(nums)-1 == i {
		return nums[i]
	}

	r := nums[i] + rec(i+1, true, nums)
	nr := rec(i+1, false, nums)
	if r < nr {
		return nr
	} else {
		return r
	}
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
