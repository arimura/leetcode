package double

type DoubleArrayTrie struct {
	base  []int
	check []int
}

var keyMap = map[rune]int{
	'a': 1,
	'b': 2,
	'c': 3,
	'd': 4,
	'e': 5,
	'#': 6,
}

// Double Array Trie based on https://www.slideshare.net/higashiyama/ss-8738479#2
func New(c int) *DoubleArrayTrie {
	t := &DoubleArrayTrie{
		base:  make([]int, c),
		check: make([]int, c),
	}
	return t
}

func (d *DoubleArrayTrie) walk(s int, r rune) (bool, int) {
	t := d.base[s] + keyMap[r]
	if d.check[t] == s {
		return true, t
	}
	return false, 0
}
