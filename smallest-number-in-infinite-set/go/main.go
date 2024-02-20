package main

type SmallestInfiniteSet struct {
	heap        [1001]int
	heapSize    int
	heapExisted [1001]bool
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

	this.heapExisted[r] = false

	return r
}

func (this *SmallestInfiniteSet) AddBack(num int) {
	if this.infiniteIdx <= num {
		return
	}

	if this.heapExisted[num] {
		return
	}
	this.heapExisted[num] = true

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
	runTest("./methods.json", "./arg.json", "./output.json")
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.PopSmallest();
 * obj.AddBack(num);
 */
