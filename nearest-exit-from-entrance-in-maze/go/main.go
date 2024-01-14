package main

func nearestExit(maze [][]byte, entrance []int) int {
	counter := make([][]int, len(maze))
	for i := range counter {
		counter[i] = make([]int, len(maze[0]))
	}

	nexts := make([][]int, 0)

	for len(nexts) > 0 {
		tmp := make([][]int, 0)
		for _, next := range nexts {
			//go up
            

		}
	}

	return 0
}
func update(x int, y int, counter [][]int, maze [][]byte) {
    if row < 0 || row
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
