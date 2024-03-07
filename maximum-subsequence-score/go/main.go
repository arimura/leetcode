package main

import (
	"container/heap"
	"sort"
)

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

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func maxScore(nums1 []int, nums2 []int, k int) int64 {
	arr := [][]int{}
	for i := 0; i < len(nums1); i++ {
		arr = append(arr, []int{nums1[i], nums2[i]})
	}

	sort.Slice(arr, func(i, j int) bool {
		return arr[i][1] > arr[j][1]
	})

	minHeap := &MinHeap{}
	sum := 0
	for i := 0; i < k; i++ {
		heap.Push(minHeap, arr[i])
		sum += arr[i][0]
	}

	res := sum * arr[k-1][1]

	for i := k; i < len(arr); i++ {
		smallNum := heap.Pop(minHeap).([]int)
		sum += arr[i][0] - smallNum[0]

		heap.Push(minHeap, arr[i])

		res = max(res, sum*arr[i][1])
	}

	return int64(res)
}

type c struct {
	num1   []int
	num2   []int
	k      int
	output int
}

func main() {
	cases := []c{
		{
			[]int{1, 3, 3, 2},
			[]int{2, 1, 3, 4},
			3,
			12,
		},
		{
			[]int{4, 2, 3, 1, 1},
			[]int{7, 5, 10, 9, 6},
			1,
			30,
		},
	}
	for _, c := range cases {
		r := maxScore(c.num1, c.num2, c.k)
		if r != int64(c.output) {
			panic(c)
		}
	}
}
