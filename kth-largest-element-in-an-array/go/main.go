package main

import (
	"container/heap"
	"fmt"
)

type Item struct {
	value    string
	priority int
	index    int
}

type ProrityQueue []*Item

func (pq ProrityQueue) Len() int { return len(pq) }
func (pq ProrityQueue) Less(i, j int) bool {
	return pq[i].priority > pq[j].priority
}
func (pq ProrityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
	pq[i].index = i
	pq[j].index = j
}
func (pq *ProrityQueue) Push(x any) {
	n := len(*pq)
	item := x.(*Item)
	item.index = n
	*pq = append(*pq, item)
}

func (pq *ProrityQueue) Pop() any {
	old := *pq
	n := len(old)
	item := old[n-1]
	old[n-1] = nil
	item.index = -1
	*pq = old[0 : n-1]
	return item
}

func (pq *ProrityQueue) update(item *Item, value string, priority int) {
	item.value = value
	item.priority = priority
	heap.Fix(pq, item.index)
}

func findKthLargest(nums []int, k int) int {

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
