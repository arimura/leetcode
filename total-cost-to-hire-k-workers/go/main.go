package main

import (
	"container/heap"
	"fmt"
)

type node struct {
	cost   int
	idx    int
	isLeft bool
}
type MinHeap []node

func (m MinHeap) Len() int {
	return len(m)
}
func (m MinHeap) Less(i, j int) bool {
	if m[i].cost == m[j].cost {
		return m[i].idx < m[j].idx
	}
	return m[i].cost < m[j].cost
}

func (m MinHeap) Swap(i, j int) {
	m[i], m[j] = m[j], m[i]
}

func (m *MinHeap) Push(x any) {
	*m = append(*m, x.(node))
}

func (m *MinHeap) Pop() any {
	r := (*m)[len(*m)-1]
	*m = (*m)[0 : len(*m)-1]
	return r
}

func totalCost(costs []int, k int, candidates int) int64 {
	leftIdx := 0
	rightIdx := len(costs) - 1

	r := 0
	mh := MinHeap{}

	for i := 0; i < candidates; i++ {
		if leftIdx > rightIdx {
			break
		}

		heap.Push(&mh, node{costs[leftIdx], leftIdx, true})
		leftIdx++

		if leftIdx > rightIdx {
			break
		}

		heap.Push(&mh, node{costs[rightIdx], rightIdx, false})
		rightIdx--
	}
	fmt.Printf("mh: %+v\n", mh)

	for sessionI := 0; sessionI < k; sessionI++ {
		if mh.Len() == 0 {
			break
		}
		p := heap.Pop(&mh).(node)
		fmt.Println(p)
		r += p.cost

		if leftIdx > rightIdx {
			continue
		}

		if p.isLeft {
			heap.Push(&mh, node{costs[leftIdx], leftIdx, true})
			leftIdx++
		} else {
			heap.Push(&mh, node{costs[rightIdx], rightIdx, false})
			rightIdx--
		}
	}

	return int64(r)
}

func main() {
	cases := []testCase{
		{
			[]int{17, 12, 10, 2, 7, 2, 11, 20, 8},
			3,
			4,
			11,
		},
		{
			[]int{1, 2, 4, 1},
			3,
			3,
			4,
		},
	}
	for _, c := range cases {
		r := totalCost(c.costs, c.k, c.candidates)
		if r != c.out {
			panic(fmt.Sprintf("c: %+v, r: %d", c, r))
		}
	}
}

type testCase struct {
	costs      []int
	k          int
	candidates int
	out        int64
}
