package main

import (
	"fmt"
)

type node struct {
	code               rune
	depth, left, right int
}

type ResultPair struct {
	Prefixlen int
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
	nextCheckPos int
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

	siblings := d.fetch(rootNode)
	d.insert(siblings)

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
			d.err = -3
			return siblings[0:0]
		}

		if cur != prev || len(siblings) == 0 {
			var tmpNode node
			tmpNode.depth = parallel.depth + 1
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
