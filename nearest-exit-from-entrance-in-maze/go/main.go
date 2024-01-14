package main

import "fmt"

func nearestExit(maze [][]byte, entrance []int) int {

	return 0
}

func main() {
	cases := []Case{}

	for _, c := range cases {
		fmt.Println(c)
	}
}

//byte = 8-bit unsigned integer
//1 1 1 1 1 1 1 1 = 1 byte = 2^8 = 256

type Case struct {
	maze     [][]byte
	entrance []int
}
