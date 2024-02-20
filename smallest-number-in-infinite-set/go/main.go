package main

import "fmt"

type SmallestInfiniteSet struct {
	heap     [1001]int
	heapSize int
	// infiniteIdx int
}

func Constructor() SmallestInfiniteSet {
	return SmallestInfiniteSet{}
}

func (this *SmallestInfiniteSet) PopSmallest() int {

}

func (this *SmallestInfiniteSet) AddBack(num int) {
	i := this.heapSize
	this.heapSize++
	for i > 0 {
		p := (i - 1) / 2
		if this.heap[p] < num {
			break
		}
		this.heap[i] = this.heap[p]
		i = p
	}
	this.heap[i] = num
}

func main() {
	s := Constructor()
	s.AddBack(4)
	s.AddBack(2)
	s.AddBack(5)
	s.AddBack(1)
	fmt.Println(s.heap[:20])

	// s := Constructor()
	// s.AddBack(2)
	// if s.PopSmallest() == 1 {
	// 	panic("1")
	// }
	// if s.PopSmallest() == 2 {
	// 	panic("2")
	// }
	// if s.PopSmallest() == 3 {
	// 	panic("3")
	// }
	// s.AddBack(1)
	// if s.PopSmallest() == 1 {
	// 	panic("1")
	// }
	// if s.PopSmallest() == 4 {
	// 	panic("4")
	// }
	// if s.PopSmallest() == 5 {
	// 	panic("5")
	// }
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.PopSmallest();
 * obj.AddBack(num);
 */
