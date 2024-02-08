package main

import "fmt"

func uniquePaths(m int, n int) int {
	dp := make([][]int, m+1)
	for i := 0; i <= m; i++ {
		dp[i] = make([]int, n+1)
	}
	dp[m][n-1] = 1
	for x := m - 1; 0 <= x; x-- {
		for y := n - 1; 0 <= y; y-- {
			dp[x][y] = dp[x+1][y] + dp[x][y+1]
		}
	}
	fmt.Println(dp)
	return dp[0][0]
}

func main() {
	cases := []Case{
		{
			m:   3,
			n:   7,
			out: 28,
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
