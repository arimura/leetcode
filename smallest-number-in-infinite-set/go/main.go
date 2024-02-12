package main

type SmallestInfiniteSet struct {
}

func Constructor() SmallestInfiniteSet {

}

func (this *SmallestInfiniteSet) PopSmallest() int {

}

func (this *SmallestInfiniteSet) AddBack(num int) {

}

func main() {
	s := Constructor()
	s.AddBack(2)
	if s.PopSmallest() == 1 {
		panic("1")
	}
	if s.PopSmallest() == 1 {
		panic("2")
	}
	if s.PopSmallest() == 1 {
		panic("3")
	}
	s.AddBack(1)
	if s.PopSmallest() == 1 {
		panic("1")
	}
	if s.PopSmallest() == 1 {
		panic("4")
	}
	if s.PopSmallest() == 1 {
		panic("5")
	}
}

/**
 * Your SmallestInfiniteSet object will be instantiated and called as such:
 * obj := Constructor();
 * param_1 := obj.PopSmallest();
 * obj.AddBack(num);
 */
