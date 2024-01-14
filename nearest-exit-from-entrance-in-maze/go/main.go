package main

import "fmt"

func nearestExit(maze [][]byte, entrance []int) int {
	counter := make([][]int, len(maze))
	for i := range counter {
		counter[i] = make([]int, len(maze[0]))
	}
	fmt.Println(counter)
	return 0
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
