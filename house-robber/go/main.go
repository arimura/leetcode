package main

import "fmt"

func rob(nums []int) int {
	return rec(0, nums)
}

func rec(i int, nums []int) int {
	if len(nums) <= i {
		return 0
	}
	if len(nums)-1 == i {
		return nums[i]
	}

	//choose first
	f := nums[i] + rec(i+2, nums)
	//choose second
	s := nums[i+1] + rec(i+3, nums)

	if f < s {
		return s
	} else {
		return f
	}
}

func main() {
	n := 40
	nums := make([]int, n)
	for i := range nums {
		nums[i] = i % 10
	}

	cases := []Case{
		// {[]int{1, 2, 3, 1}, 4},
		// {[]int{2, 7, 9, 3, 1}, 12},
		{nums, 50 * (n / 10)},
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
