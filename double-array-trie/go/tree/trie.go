package three

// Based on https://linux.thai.net/~thep/datrie/datrie.html
// three array trie

type ThreeArrayTrie struct {
	base  []int
	next  []int
	check []int
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

var transition = [][]rune{
	{},    //not used
	{'p'}, //root node
	{'r', 'o'},
	{'o'},
}

func New(c int) *ThreeArrayTrie {
	t := &ThreeArrayTrie{
		base:  make([]int, c),
		next:  make([]int, c),
		check: make([]int, c),
	}
	return t
}

// walk from state:s by character:c
// return (success, next state)
func (x *ThreeArrayTrie) walk(s, c int) (bool, int) {
	t := x.base[s] + c
	if x.check[t] == s {
		return true, x.next[t]
	} else {
		return false, 0
	}
}

// s: state. each state is a node in the trie and is represented by an integer
// b: baseIndex. For a trie node s, base[s] is the starting index within the next and check pool (to be explained later) for the row of the node s in the transition table.
func (x *ThreeArrayTrie) relocate(s int, b int) {
	for _, ck := range transition[s] {
		c := keyMap[ck]
		x.check[b+c] = s
		x.next[b+c] = x.next[x.base[s]+c]
		x.check[x.base[s]+c] = 0
	}
	x.base[s] = b
}
