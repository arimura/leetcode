package main

import "fmt"

var heap []int
var size = 0

func findKthLargest(nums []int, k int) int {
	heap = make([]int, 1000000)
	for i := range heap {
		heap[i] = 10001
	}
	for _, n := range nums {
		push(n)
	}

	r := 0
	for i := 0; i < len(nums)-k+1; i++ {
		r = pop()
	}

	return r
}

func push(num int) {
	i := size
	size++

	for i > 0 {
		p := (i - 1) / 2
		// fmt.Printf("num: %d, p: %d, heap[p]: %d\n", num, p, heap[p])
		if heap[p] <= num {
			break
		}
		heap[i] = heap[p]
		i = p
	}
	heap[i] = num
}

func pop() int {
	r := heap[0]
	size--
	x := heap[size]
	i := 0
	for i*2+1 < size {
		a := i*2 + 1
		b := i*2 + 2
		if b < size && heap[b] < heap[a] {
			a = b
		}
		if heap[a] > x {
			break
		}
		heap[i] = heap[a]
		i = a
	}
	heap[i] = x
	return r
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
