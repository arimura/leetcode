package three

import "fmt"

// Based on https://linux.thai.net/~thep/datrie/datrie.html
// three array trie
var base []int
var next []int
var check []int
var currnt int

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

func walk(s, c int) {
	t := base[s] + c
	if check[t] == s {
		currnt = next[t]
	} else {
		panic(fmt.Sprintf("t: %d isn't in check\n", t))
	}
}

func simpleInsert() {
	//start from root node
	//s = 0
}

// s: state. each state is a node in the trie and is represented by an integer
// b: baseIndex. For a trie node s, base[s] is the starting index within the next and check pool (to be explained later) for the row of the node s in the transition table.
func relocate(s int, b int) {
	for _, ck := range transition[s] {
		c := keyMap[ck]
		check[b+c] = s
		next[b+c] = next[base[s]+c]
		check[base[s]+c] = 0
	}
	base[s] = b
}
