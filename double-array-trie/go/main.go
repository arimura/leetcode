package main

import "fmt"

//Based on https://linux.thai.net/~thep/datrie/datrie.html

var base []int
var next []int
var check []int
var currnt int

func walk(s, c int) {
	t := base[s] + c
	if check[t] == s {
		currnt = next[t]
	} else {
		panic(fmt.Sprintf("t: %d isn't in check\n", t))
	}
}

func relocate(state int, baseIndex int) {

}
