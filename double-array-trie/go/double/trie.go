package double

import (
	"fmt"
)

type DoubleArrayTrie struct {
	base   []int
	check  []int
	keyMap map[rune]int
	valMap map[int]rune
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
	t.valMap = map[int]rune{
		1: 'a',
		2: 'b',
		3: 'c',
		4: 'd',
		5: 'e',
		6: '#',
	}
	return t
}

func (d *DoubleArrayTrie) ExactMatchSearch(key string) bool {
	r, s, _ := d.walkBykey(key)
	if !r {
		return false
	}
	if d.base[s] == 0 {
		return true
	}
	return false
}

// "ab#" is in dat, if walk by "a", return true, 2, 1
func (d *DoubleArrayTrie) walkBykey(key string) (bool, int, int) {
	s := 1
	//depth:0 is root node
	depth := 0
	for _, r := range key {
		result, rs := d.walk(s, r)
		if !result {
			return false, s, depth
		}
		s = rs
		depth++
	}
	return true, s, depth
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
	for _, r := range key {
		base := d.decideBase(r)
		d.base[s] = base
		d.check[base+d.keyMap[r]] = s
		s = base + d.keyMap[r]
	}
}

func (d *DoubleArrayTrie) insert2(key string) {
	ws, s, depth := d.walkBykey(key)
	if !ws {
		for _, r := range key[depth:] {
			//check conflict
			if (d.check[d.base[s]+d.keyMap[r]]) == 0 {
				fmt.Println("no conflict")
				labels := make([]rune, 0)
				for i, c := range d.check {
					if c == s {
						labels = append(labels, d.valMap[i])
					}
				}
			} else {
				fmt.Println("conflict")
				base := d.decideBase(r)
				d.base[s] = base
				d.check[base+d.keyMap[r]] = s
				s = base + d.keyMap[r]
			}
		}
	}
}

func (d *DoubleArrayTrie) decideBase(r rune) int {
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
