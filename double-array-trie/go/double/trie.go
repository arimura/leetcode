package double

import (
	"fmt"
)

type DoubleArrayTrie struct {
	base           []int
	check          []int
	labelCharToVal map[rune]int
	labelValToChar map[int]rune
}

// Double Array Trie based on https://www.slideshare.net/higashiyama/ss-8738479#2
func New(c int) *DoubleArrayTrie {
	t := &DoubleArrayTrie{
		base:  make([]int, c),
		check: make([]int, c),
	}
	t.labelCharToVal = map[rune]int{
		'a': 1,
		'b': 2,
		'c': 3,
		'd': 4,
		'e': 5,
		'#': 6,
	}
	t.labelValToChar = map[int]rune{
		1: 'a',
		2: 'b',
		3: 'c',
		4: 'd',
		5: 'e',
		6: '#',
	}
	return t
}

func (d *DoubleArrayTrie) logArray() {
	fmt.Printf("base:  %v\n", d.base)
	fmt.Printf("check: %v\n", d.check)
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
	t := d.base[s] + d.labelCharToVal[r]
	if d.check[t] == s {
		return true, t
	}
	return false, 0
}

func (d *DoubleArrayTrie) insert(key string) {
	ws, s, depth := d.walkBykey(key)
	if !ws {
		for _, r := range key[depth:] {
			//check conflict
			if (d.check[d.base[s]+d.labelCharToVal[r]]) == 0 {
				fmt.Printf("no conflict with %s\n", string(r))
				base := d.decideBase(r, 1)
				d.base[s] = base
				d.check[base+d.labelCharToVal[r]] = s
				s = base + d.labelCharToVal[r]
				d.logArray()
			} else {
				fmt.Printf("conflict on state: %d, label: %s\n", s, string(r))
				labels := make([]rune, 0)
				for i, c := range d.check {
					if c == s {
						labels = append(labels, d.labelValToChar[i-d.base[s]])
					}
				}
				fmt.Printf("labels: %v\n", string(labels))
				//change s base for labels
				var tmpBase int
				for i := 0; i < 100; i++ {
					if i == 99 {
						panic("failed to decide base")
					}

					fmt.Printf("try decide with base: %d\n", d.base[s]+1+i)
					tmpBase = d.decideBase(r, d.base[s]+1+i)
					ok := true
					for _, l := range labels {
						if d.check[tmpBase+d.labelCharToVal[l]] == 0 {
							continue
						}
						ok = false
						break
					}
					if ok {
						fmt.Println("ok")
						break
					}
				}
				fmt.Printf("next base: %d\n", tmpBase)

				pastIndex := s
				pastBase := d.base[pastIndex]
				fmt.Printf("past index: %v\n", pastIndex)
				fmt.Printf("past base: %v\n", pastBase)
				//update base of conflict
				d.base[s] = tmpBase

				// Update check by new base
				// r is newly added label and no child node
				d.check[d.base[s]+d.labelCharToVal[r]] = s
				// update already existing child nodes of conflict node
				for _, label := range labels {
					//update childe nodes of conflict note
					d.check[d.base[s]+d.labelCharToVal[label]] = s
					d.base[d.base[s]+d.labelCharToVal[label]] = d.base[pastBase+d.labelCharToVal[label]]
					//update child nodes of child nodes ot conflict node
					if d.base[pastIndex] > 0 {
						idxFromPast := make([]int, 0)
						for i, l := range d.check {
							if l == d.base[pastIndex] {
								idxFromPast = append(idxFromPast, i)
							}
						}
						fmt.Printf("idx from past: %v\n", idxFromPast)
						for _, idx := range idxFromPast {
							d.check[idx] = d.base[s] + d.labelCharToVal[label]
						}
					}
					d.base[pastBase+d.labelCharToVal[label]] = 0
					d.check[pastBase+d.labelCharToVal[label]] = 0
				}
				s = d.base[s] + d.labelCharToVal[r]
				d.logArray()
			}
		}
	}
}

func (d *DoubleArrayTrie) decideBase(r rune, startBase int) int {
	base := startBase
	stop := false
	for !stop {
		t := base + d.labelCharToVal[r]
		if d.check[t] == 0 {
			return base
		}
		base++
	}
	panic("can't find base")
}
