package main

type SmallestInfiniteSet struct {
	heap        [1001]int
	heapSize    int
	infiniteIdx int
}

func Constructor() SmallestInfiniteSet {
	return SmallestInfiniteSet{infiniteIdx: 1}
}

func (this *SmallestInfiniteSet) PopSmallest() int {
	r := this.heap[0]

	if this.heapSize == 0 {
		r = this.infiniteIdx
		this.infiniteIdx++
		return r
	}

	this.heap[0] = this.heap[this.heapSize-1]
	this.heapSize--
	i := 0
	for i < this.heapSize {
		lIdx := i*2 + 1
		rIdx := i*2 + 2
		if rIdx < this.heapSize && this.heap[rIdx] < this.heap[lIdx] {
			lIdx = rIdx
		}
		if this.heapSize <= lIdx || this.heap[i] < this.heap[lIdx] {
			break
		}
		t := this.heap[i]
		this.heap[i] = this.heap[lIdx]
		this.heap[lIdx] = t
		i = lIdx
	}

	return r
}

func (this *SmallestInfiniteSet) AddBack(num int) {
	if this.infiniteIdx <= num {
		return
	}

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
	s.AddBack(2)
	if s.PopSmallest() != 1 {
		panic("not 1")
	}
	if s.PopSmallest() != 2 {
		panic("not 2")
	}
	if s.PopSmallest() != 3 {
		panic("not 3")
	}
	s.AddBack(1)
	if s.PopSmallest() != 1 {
		panic("not 1")
	}
	if s.PopSmallest() != 4 {
		panic("not 4")
	}
	if s.PopSmallest() != 5 {
		panic("not 5")
	}
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.PopSmallest();
 * obj.AddBack(num);
 */
