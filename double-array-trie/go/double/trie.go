package double

type DoubleArrayTrie struct {
	capacity int
	base     []int
	check    []int
}

var keyMap = map[rune]int{
	'a': 0,
	'c': 1,
	'd': 2,
	'e': 3,
	'g': 4,
	'i': 5,
	'l': 6,
	'o': 7,
	'p': 8,
	'r': 9,
	's': 10,
	'u': 11,
	'v': 12,
	'w': 13,
	'z': 14,
}

type transition struct {
	next int
	c    rune
}

func New(c int) *DoubleArrayTrie {
	t := &DoubleArrayTrie{
		capacity: c,
		base:     make([]int, c),
		check:    make([]int, c),
	}
	return t
}

// walk from state:s by character:c
// return (success, next state)
func (x *DoubleArrayTrie) walk(s int, c rune) (bool, int) {
	t := x.base[s] + keyMap[c]
	if x.check[t] == s {
		return true, t
	} else {
		return false, 0
	}
}

func (x *DoubleArrayTrie) available(s int, b int, c rune) bool {
	if x.base[s] != 0 {
		return false
	}
	if x.check[b+keyMap[c]] != 0 {
		return false
	}
	return true
}

func (x *DoubleArrayTrie) insert(s int, b int, c rune, n int) bool {
	if !x.available(s, b, c) {
		return false
	}
	x.base[s] = b
	x.check[x.base[s]+keyMap[c]] = s
	return true
}
