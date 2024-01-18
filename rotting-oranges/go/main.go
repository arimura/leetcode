package main

import "fmt"

func orangesRotting(grid [][]int) int {
	freshCnt := 0
	noFresh := 0
	newRottens := make([][]int, 0)
	for r, row := range grid {
		for c, cell := range row {
			if cell == 1 {
				freshCnt++
			}
			if cell == 2 {
				newRottens = append(newRottens, []int{r, c})
			}
		}
	}
	if freshCnt == 0 {
		return 0
	}
	c := -1
	for len(newRottens) > 0 {
		nexts := make([][]int, 0)
		for _, r := range newRottens {
			try(r[0]+1, r[1], &grid, &noFresh, &nexts)
			try(r[0]-1, r[1], &grid, &noFresh, &nexts)
			try(r[0], r[1]+1, &grid, &noFresh, &nexts)
			try(r[0], r[1]-1, &grid, &noFresh, &nexts)
		}
		newRottens = nexts
		c++
	}
	if freshCnt == noFresh {
		return c
	}
	return -1
}

func try(row int, col int, grid *[][]int, cnt *int, new *[][]int) {
	if row < 0 || len(*grid) <= row || col < 0 || len((*grid)[0]) <= col {
		return
	}
	if (*grid)[row][col] == 2 || (*grid)[row][col] == 0 {
		return
	}
	(*grid)[row][col] = 2
	*cnt++
	*new = append((*new), []int{row, col})
}

func main() {
	cases := []Case{
		{
			[][]int{{2, 1, 1}, {1, 1, 0}, {0, 1, 1}},
			4,
		},
		{
			[][]int{{2, 1, 1}, {0, 1, 1}, {1, 0, 1}},
			-1,
		},
		{
			[][]int{{0, 2}},
			0,
		},
		{
			[][]int{{0}},
			0,
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
