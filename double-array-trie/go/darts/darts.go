package darts

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
