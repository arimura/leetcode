package tripple

// Based on https://linux.thai.net/~thep/datrie/datrie.html
// three array trie

type TrippleArrayTrie struct {
	capacity int
	base     []int
	next     []int
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

// var transition = [][]rune{
// 	{},    //not used
// 	{'p'}, //root node
// 	{'r', 'o'},
// 	{'o'},
// }

func New(c int) *TrippleArrayTrie {
	t := &TrippleArrayTrie{
		capacity: c,
		base:     make([]int, c),
		next:     make([]int, c),
		check:    make([]int, c),
	}
	return t
}

// walk from state:s by character:c
// return (success, next state)
func (x *TrippleArrayTrie) walk(s int, c rune) (bool, int) {
	t := x.base[s] + keyMap[c]
	if x.check[t] == s {
		return true, x.next[t]
	} else {
		return false, 0
	}
}

type transition struct {
	next int
	c    rune
}

func (x *TrippleArrayTrie) insertTransitions(s, b int, ts *[]transition) bool {
	canInsert := false
	for i := b; i < x.capacity; i++ {
		canInsert = true
		for _, t := range *ts {
			if !x.available(s, i, t.c) {
				canInsert = false
				break
			}
		}
		if canInsert {
			b = i
			break
		}
	}
	if !canInsert {
		return false
	}

	for _, t := range *ts {
		r := x.insert(s, b, t.c, t.next)
		if !r {
			panic("Unexpected insert")
		}
	}
	return true
}

func (x *TrippleArrayTrie) available(s int, b int, c rune) bool {
	if x.base[s] != 0 {
		return false
	}
	if x.next[b+keyMap[c]] != 0 {
		return false
	}
	if x.check[b+keyMap[c]] != 0 {
		return false
	}
	return true
}

func (x *TrippleArrayTrie) insert(s int, b int, c rune, n int) bool {
	x.base[s] = b
	if x.next[b+keyMap[c]] == 0 {
		x.next[b+keyMap[c]] = n
		x.check[b+keyMap[c]] = s
		return true
	} else {
		return false
	}
}

// s: state. each state is a node in the trie and is represented by an integer
// b: baseIndex. For a trie node s, base[s] is the starting index within the next and check pool (to be explained later) for the row of the node s in the transition table.
// func (x *ThreeArrayTrie) relocate(s int, b int) {
// 	for _, ck := range transition[s] {
// 		c := keyMap[ck]
// 		x.check[b+c] = s
// 		x.next[b+c] = x.next[x.base[s]+c]
// 		x.check[x.base[s]+c] = 0
// 	}
// 	x.base[s] = b
// }
