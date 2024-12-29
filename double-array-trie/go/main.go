package main

import (
	"fmt"

	"github.com/arimura/leetcode/double-array-trie/darts"
)

func main() {
	d, err := darts.Import("darts.txt", "dats.libz", false)
	if err == nil {
		if d.ExactMatchSearch([]rune("テスト"), 0) {
			fmt.Println("テスト is in dictionary")
		}
	}
}
