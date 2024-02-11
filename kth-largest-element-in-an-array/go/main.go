package main

import "fmt"

var heap = make([]int, 100000)
var size = 0

func findKthLargest(nums []int, k int) int {
	for _, n := range nums {
		push(n)
	}

	fmt.Println(heap[:100])
	return 0
}

func push(num int) {
	size++

	for size > 0 {
		p := (size - 1) / 2
		if heap[p] <= num {
			break
		}
		heap[size] = heap[p]
		size = p
	}
	heap[size] = num
}

func main() {
	cases := []Case{
		{
			[]int{3, 2, 1, 5, 6, 4},
			2,
			5,
		},
		{
			[]int{3, 2, 3, 1, 2, 4, 5, 5, 6},
			4,
			4,
		},
	}
	for _, c := range cases {
		r := findKthLargest(c.nums, c.k)
		if r != c.answear {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type Case struct {
	nums    []int
	k       int
	answear int
}
