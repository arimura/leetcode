package main

import "fmt"

type MinHeap [][]int

func (m MinHeap) Len() int {
	return len(m)
}
func (m MinHeap) Less(i, j int) bool {
	if m[i][0] == m[j][0] {
		return m[i][1] < m[j][1]
	}
	return m[i][0] < m[j][0]
}

func (m MinHeap) Swap(i, j int) {
	m[i], m[j] = m[j], m[i]
}

func (m *MinHeap) Push(x any) {
	*m = append(*m, x.([]int))
}

func (m *MinHeap) Pop() any {
	r := (*m)[len(*m)-1]
	*m = (*m)[0 : len(*m)-1]
	return r
}

func totalCost(costs []int, k int, candidates int) int64 {
	leftI := 0
	rightI := len(costs)

	for sessionI := 0; sessionI < k; sessionI++ {

	}

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
