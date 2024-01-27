package main

import "testing"

func TestBase(t *testing.T) {
	i := []int{2, 7, 9, 3, 1}
	if 12 != rob(i) {
		t.Errorf("i: %+v", i)
	}
}

func BenchmarkRob10(b *testing.B) {
	for i := 0; i < b.N; i++ {
		rob(makeNums(10))
	}
}

func BenchmarkRob20(b *testing.B) {
	for i := 0; i < b.N; i++ {
		rob(makeNums(20))
	}
}

func BenchmarkRob30(b *testing.B) {
	for i := 0; i < b.N; i++ {
		rob(makeNums(30))
	}
}

func makeNums(n int) []int {
	nums := make([]int, n)
	for i := range nums {
		nums[i] = i % 10
	}
	return nums

}
