package main

import "fmt"

type MinHeap [][]int

func (h MinHeap) Len() int {
	return len(h)
}
func (h MinHeap) Less(i, j int) bool {
	return h[i][0] < h[j][0]
}
func (h MinHeap) Swap(i, j int) {
	h[i], h[j] = h[j], h[i]
}
func (h *MinHeap) Push(x interface{}) {
	*h = append(*h, x.([]int))
}
func (h *MinHeap) Pop() interface{} {
	x := (*h)[len(*h)-1]
	*h = (*h)[:len(*h)-1]
	return x
}

func maxScore(nums1 []int, nums2 []int, k int) int64 {
	return 0
}

type c struct {
	num1 []int
	num2 []int
	k    int
}

func main() {
	fmt.Println("hoge")
	// cases := []c{
	// 	{
	// 		[]int{1, 3, 3, 2},
	// 		[]int{2, 1, 3, 4},
	// 		3,
	// 	},
	// 	{
	// 		[]int{4, 2, 3, 1, 1},
	// 		[]int{7, 5, 10, 9, 6},
	// 		1,
	// 	},
	// }
	// for _, c := range cases {

	// }
}
