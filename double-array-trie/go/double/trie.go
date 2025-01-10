package double

type DoubleArrayTrie struct {
	base   []int
	check  []int
	keyMap map[rune]int
}

// Double Array Trie based on https://www.slideshare.net/higashiyama/ss-8738479#2
func New(c int) *DoubleArrayTrie {
	t := &DoubleArrayTrie{
		base:  make([]int, c),
		check: make([]int, c),
	}
	t.keyMap = map[rune]int{
		'a': 1,
		'b': 2,
		'c': 3,
		'd': 4,
		'e': 5,
		'#': 6,
	}
	return t
}

func (d *DoubleArrayTrie) ExactMatchSearch(key string) bool {
	s := 1
	for _, r := range key {
		result, rs := d.walk(s, r)
		if !result {
			return false
		}
		s = rs
	}
	if d.base[s] == 0 {
		return true
	}
	return false
}

func (d *DoubleArrayTrie) walk(s int, r rune) (bool, int) {
	t := d.base[s] + d.keyMap[r]
	if d.check[t] == s {
		return true, t
	}
	return false, 0
}
