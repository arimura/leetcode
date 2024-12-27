package darts

import "fmt"

//https://github.com/awsong/go-darts/blob/master/darts.go

type node struct {
	node               rune
	depth, left, right int
}

type ReslutPair struct {
	PrefixLen int
	Value
}

type SubWord struct {
	OffSet int
	Len    int
}

type Value struct {
	Freq     int
	SubWords []SubWord
}

type Darts struct {
	Base      []int
	Check     []int
	ValuePool []Value
}

type dartsBuild struct {
	darts        Darts
	used         []bool
	size         int
	keySize      int
	key          [][]rune
	freq         []int
	nectCheckPos int
	err          int
}

func Build(key [][]rune, freq []int) Darts {
	var d = new(dartsBuild)

	d.key = key
	d.freq = freq
	d.resize(512)

	d.darts.Base[0] = 1
	d.nextCheckPos = 0

	var rootNode node
	rootNode.depth = 0
	rootNode.left = 0
	rootNode.right = len(key)

	sibling := d.fetch(rootNode)
	d.insert(sibling)

	if d.err < 0 {
		panic("Build error")
	}
	return d.darts
}

func (d *dartsBuild) resize(newSize int) {
	if newSize > cap(d.darts.Base) {
		d.darts.Base = append(d.darts.Base, make([]int, (newSize-len(d.darts.Base)))...)
		d.darts.Check = append(d.darts.Check, make([]int, (newSize-len(d.darts.Check)))...)
		d.used = append(d.used, make([]bool, (newSize-len(d.used)))...)
	} else {
		d.darts.Base = d.darts.Base[:newSize]
		d.darts.Check = d.darts.Check[:newSize]
		d.used = d.used[:newSize]
	}
}

func (d *dartsBuild) fetch(parent node) []node {
	var siblings = make([]node, 0, 2)
	if d.err < 0 {
		return siblings[0:0]
	}
	var prev rune = 0

	for i := parent.left; i < parent.right; i++ {
		if len(d.key[i]) < parent.depth {
			continue
		}

		tmp := d.key[i]

		var cur rune = 0
		if len(d.key[i]) != parent.depth {
			cur = tmp[parent.depth] + 1
		}

		if prev > cur {
			fmt.Println(prev, cur, i, parent.depth, d.key[i])
			fmt.Println(d.key[i])
			panic("fetch error 1")
		}

		if cur != prev || len(siblings) == 0 {
			var tmpNode node
			tmpNode.depth = parent.depth + 1
			tmpNode.code = cur
			tmpNode.left = i
			if len(siblings) != 0 {
				siblings[len(siblings)-1].right = i
			}

			siblings = append(siblings, tmpNode)
		}

		prev = cur
	}

	if len(siblings) != 0 {
		siblings[len(siblings)-1].right = parent.right
	}

	return siblings
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func (d *dartsBuild) insert(siblings []node) int {
	if d.err < 0 {
		panic("insert error")
	}

	var begin int = 0
	var pos int = max(int(siblings[0].code)+1, d.nextCheckPos) - 1
	var nonZeroNum int = 0
	first := false
	if len(d.darts.Base) <= pos {
		d.resize(pos + 1)
	}

	for {
	next:
		pos++

		if len(d.darts.Base) <= pos {
			d.resize(pos + 1)
		}

		if d.darts.Check[pos] > 0 {
			nonZeroNum++
			continue
		} else if !first {
			d.nextCheckPos = pos
			first = true
		}

		begin = pos - int(siblings[0].code)
		if len(d.darts.Base) <= (begin + int(siblings[lens(siblings)-1].code)) {
			d.resize(begin + int(siblings[len(siblings)-1].code+400))
		}

		if d.used[begin] {
			continue
		}

		for i := 1; i < len(siblings); i++ {
			if begin+int(siblings[i].code) >= len(d.darts.Base) {
				fmt.Println(len(d.darts.Base), begin+int(siblings[i].code), begin+int(siblings[len(siblings)-1].code))
			}
			if 0 != d.darts.Check[begin+int(siblings[i].code)] {
				goto next
			}
		}
		break
	}

	if float32(nonZeroNum)/float32(pos-d.nectCheckPos+1) >= 0.95 {
		d.nectCheckPos = pos
	}
	d.used[begin] = true
	d.size = max(d.size, begin+int(siblings[len(siblings)-1].code)+1)

	for i := 0; i < len(siblings); i++ {
		d.darts.Check[begin+int(siblings[i].code)] = begin
	}

	for i := 0; i < len(siblings); i++ {
		newSiblings := d.fetch(siblings[i])
		if len(newSiblings) == 0 {
			var value Value
			value.Freq = d.freq[siblings[i].left]
			d.darts.Base[begin+int(siblings[i].code)] = -len(d.darts.ValuePool)
			d.darts.ValuePool = append(d.darts.ValuePool, value)
		} else {
			h := d.insert(newSiblings)
			d.darts.Base[begin+int(siblings[i].code)] = h
		}
	}

	return begin
}

func (d Darts) UpdateThesaurus(keys [][]rune) {
f0:
	for _, key := range keys {
		wordLen := len(key)
		if wordLen < 2 {
			continue
		}

		var subWords []SubWord
		for i := 0; i < wordLen-1; i++ {
			results := d.CommonPrefixSearch(key[i:], 0)
			for _, result := range results {
				if result.PrefixLen > 1 && result.PrefixLen < wordLen {
					subWords = append(subWords, SubWord{i, result.PrefixLen})
				}
			}
		}

		b := d.Base[0]
		var p int

		for i := 0; i < len(key); i++ {
			p = b + int(key[i]) + 1
			if b == d.Check[p] {
				b = d.Base[p]
			} else {
				continue f0
			}
		}

		p = b
		n := d.Base[p]
		if b == d.Check[p] && n < 0 {
			d.ValuePool[-n-1].SubWords = subWords
		}
	}
}

func (d Darts) ExactMatchSearch(key []rune, nodePos int) bool {
	b := d.Base[nodePos]
	var p int

	for i := 0; i < len(key); i++ {
		p = b + int(key[i]) + 1
		if b == d.Check[p] {
			b = d.Base[p]
		} else {
			return false
		}
	}

	p = b
	n := d.Base[p]
	if b == d.Check[p] && n < 0 {
		return true
	}
	return false
}
