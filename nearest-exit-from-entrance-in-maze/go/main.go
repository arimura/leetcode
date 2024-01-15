package main

func nearestExit(maze [][]byte, entrance []int) int {
	counter := make([][]int, len(maze))
	for i := range counter {
		counter[i] = make([]int, len(maze[0]))
	}

	positions := make([][]int, 0)

	for len(positions) > 0 {
		position := positions[0]
		positions = positions[1:]
		cnt := counter[position[0]][position[1]]

		if update(position[0]-1, position[1], counter, maze, &positions, cnt) ||
			update(position[0]+1, position[1], counter, maze, &positions, cnt) ||
			update(position[0], position[1]-1, counter, maze, &positions, cnt) ||
			update(position[0], position[1]+1, counter, maze, &positions, cnt) {
			return cnt
		}
	}

	return 0
}

func update(row int, col int, counter [][]int, maze [][]byte, nexts *[][]int, cnt int) bool {
	if row < 0 || len(maze) <= row || col < 0 || len(maze[0]) <= col {
		return true
	}

	if maze[row][col] == '+' {
		return false
	}
	counter[row][col] = cnt + 1
	*nexts = append(*nexts, []int{row, col})
	return false
}

func main() {
	cases := []Case{
		{
			[][]byte{{'+', '+', '.', '+'}, {'.', '.', '.', '+'}, {'+', '+', '+', '.'}},
			[]int{1, 2},
		},
	}

	for _, c := range cases {
		nearestExit(c.maze, c.entrance)
	}
}

//byte = 8-bit unsigned integer
//1 1 1 1 1 1 1 1 = 1 byte = 2^8 = 256

type Case struct {
	maze     [][]byte
	entrance []int
}
