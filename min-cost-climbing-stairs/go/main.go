package main

import "fmt"

func minCostClimbingStairs(cost []int) int {
	if len(cost) < 2 {
		return 0
	}
	mc := make([]int, len(cost)+1)
	for i := 2; i < len(mc); i++ {
		step2 := cost[i-2] + mc[i-2]
		step1 := cost[i-1] + mc[i-1]
		if step1 < step2 {
			mc[i] = step1
		} else {
			mc[i] = step2
		}
	}
	return mc[len(mc)-1]
}

func main() {
	cases := []Case{
		{[]int{10, 15, 20}, 15},
		{[]int{1, 100, 1, 1, 1, 100, 1, 1, 100, 1}, 6},
		{[]int{0, 2, 2, 1}, 2},
		{[]int{1, 100}, 1},
	}
	for _, c := range cases {
		r := minCostClimbingStairs(c.cost)
		if r != c.output {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	cost   []int
	output int
}
