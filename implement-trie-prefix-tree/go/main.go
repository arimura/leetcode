package main

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
