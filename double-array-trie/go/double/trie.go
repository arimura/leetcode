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
