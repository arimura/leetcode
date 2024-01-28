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
		m := noRobMemo[i]
		if m != -1 {
			return m
		}
		r := rec(i+1, false, nums)
		noRobMemo[i] = r
		return r
	}
	if len(nums) <= i {
		return 0
	}
	if len(nums)-1 == i {
		return nums[i]
	}
	r := robMemo[i]
	if r == -1 {
		r = nums[i] + rec(i+1, true, nums)
		robMemo[i] = r
	}
	nr := noRobMemo[i]
	if nr == -1 {
		nr = rec(i+1, false, nums)
		noRobMemo[i] = nr
	}
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
