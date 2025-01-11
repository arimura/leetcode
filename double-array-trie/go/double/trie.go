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
	r, s := d.walkBykey(key)
	if !r {
		return false
	}
	if d.base[s] == 0 {
		return true
	}
	return false
}

func (d *DoubleArrayTrie) walkBykey(key string) (bool, int) {
	s := 1
	for _, r := range key {
		result, rs := d.walk(s, r)
		if !result {
			return false, 0
		}
		s = rs
	}
	return true, s
}

func (d *DoubleArrayTrie) walk(s int, r rune) (bool, int) {
	t := d.base[s] + d.keyMap[r]
	if d.check[t] == s {
		return true, t
	}
	return false, 0
}

func (d *DoubleArrayTrie) insert(key string) {
	s := 1
	for _, r := range []rune(key) {
		base := d.decideBase(s, r)
		d.base[s] = base
		d.check[base+d.keyMap[r]] = s
		s = base + d.keyMap[r]
	}
}

func (d *DoubleArrayTrie) decideBase(s int, r rune) int {
	base := 1
	stop := false
	for !stop {
		t := base + d.keyMap[r]
		if d.check[t] == 0 {
			return base
		}
		base++
	}
	panic("can't find base")
}
