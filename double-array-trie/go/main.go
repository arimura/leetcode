package main

import "fmt"

//Based on https://linux.thai.net/~thep/datrie/datrie.html

var base []int
var next []int
var check []int
var currnt int

var ckey = []rune{
	'a',
	'c',
	'd',
	'e',
	'g',
	'i',
	'l',
	'o',
	'p',
	'r',
	's',
	'u',
	'v',
	'w',
	'z',
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

// state: each state is a node in the trie and is represented by an integer
// baseIndex:  For a trie node s, base[s] is the starting index within the next and check pool (to be explained later) for the row of the node s in the transition table.
func relocate(state int, baseIndex int) {

}
