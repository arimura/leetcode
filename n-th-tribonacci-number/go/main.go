package main

import "fmt"

func tribonacci(n int) int {
	if n == 0 {
		return 0
	}
	if n == 1 {
		return 1
	}
	if n == 2 {
		return 1
	}
	nums := make([]int, n+1)
	nums[0] = 0
	nums[1] = 1
	nums[2] = 1
	for i := 3; i <= n; i++ {
		nums[i] = nums[i-3] + nums[i-2] + nums[i-1]
	}
	return nums[n]
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
