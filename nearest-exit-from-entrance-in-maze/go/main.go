package main

import "fmt"

func nearestExit(maze [][]byte, entrance []int) int {
	counter := make([][]int, len(maze))
	for i := range counter {
		counter[i] = make([]int, len(maze[0]))
	}

	positions := make([][]int, 0)
	positions = append(positions, entrance)

	cnt := 1
	for true {
		if len(positions) == 0 {
			break
		}
		tmpPositions := make([][]int, 0)
		for _, pos := range positions {
			if update(pos[0]-1, pos[1], &counter, maze, &tmpPositions, cnt) ||
				update(pos[0]+1, pos[1], &counter, maze, &tmpPositions, cnt) ||
				update(pos[0], pos[1]-1, &counter, maze, &tmpPositions, cnt) ||
				update(pos[0], pos[1]+1, &counter, maze, &tmpPositions, cnt) {
				return cnt - 1
			}
		}
		positions = tmpPositions
		cnt++
	}

	return -1
}

func update(row int, col int, counter *[][]int, maze [][]byte, nexts *[][]int, cnt int) bool {

	if row < 0 || len(maze) <= row || col < 0 || len(maze[0]) <= col {
		if cnt == 1 {
			return false
		}
		return true
	}

	if maze[row][col] == '+' {
		return false
	}
	(*counter)[row][col] = cnt + 1
	*nexts = append(*nexts, []int{row, col})
	return false
}

func main() {
	cases := []Case{
		{
			[][]byte{{'+', '+', '.', '+'}, {'.', '.', '.', '+'}, {'+', '+', '+', '.'}},
			[]int{1, 2},
			1,
		},
		{
			[][]byte{{'+', '+', '+'}, {'.', '.', '.'}, {'+', '+', '+'}},
			[]int{1, 0},
			2,
		},
		{
			[][]byte{{'.', '+'}},
			[]int{0, 0},
			-1,
		},
	}

	for _, c := range cases {
		r := nearestExit(c.maze, c.entrance)
		if c.answear != r {
			panic(fmt.Sprintf("c: %+v, a: %d", c, r))
		}
	}
}

//byte = 8-bit unsigned integer
//1 1 1 1 1 1 1 1 = 1 byte = 2^8 = 256

type Case struct {
	maze     [][]byte
	entrance []int
	answear  int
}
