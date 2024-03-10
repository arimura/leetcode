package main

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

}

func main() {
}
