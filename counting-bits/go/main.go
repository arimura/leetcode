package main

import (
	"fmt"
	"strconv"
)

func countBits(n int) []int {
	r := make([]int, 0)
	for i := 0; i <= n; i++ {
		cnt := 0
		for _, c := range strconv.FormatInt(int64(i), 2) {
			if c == '1' {
				cnt++
			}
		}
		r = append(r, cnt)
	}
	return r
}

func main() {
	fmt.Println(countBits(5))
}
