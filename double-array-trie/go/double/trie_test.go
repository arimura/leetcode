package double

import (
	"testing"
)

func newWith_abdSharp() *DoubleArrayTrie {
	d := New(0)
	d.base = []int{0, 1, 3, 0, 0, 2, 2, 0, 0}
	d.check = []int{0, 0, 1, 0, 0, 2, 5, 0, 6}
	return d
}

func newWith_abSharp() *DoubleArrayTrie {
	d := New(0)
	d.base = []int{0, 1, 1, 1, 0, 0, 0, 0, 0, 0}
	d.check = []int{0, 0, 1, 2, 0, 0, 0, 3, 0, 0}
	return d
}

func TestExactMatchSearch(t *testing.T) {
	d := newWith_abdSharp()

	r := d.ExactMatchSearch("abd#")
	if !r {
		t.Error("fail with abd#")
		t.Fail()
	}

	r = d.ExactMatchSearch("ab")
	if r {
		t.Error("fail with ab")
		t.Fail()
	}
}

func TestWalk(t *testing.T) {
	d := newWith_abdSharp()
	next := 1
	result := false
	for _, r := range []rune{'a', 'b', 'd', '#'} {
		result, next = d.walk(next, r)
		if !result {
			t.Error("failed to walk")
		}
	}

	result, _ = d.walk(1, 'b')
	if result {
		t.Error("invalid walk")
	}
}

func TestWaklbyKey(t *testing.T) {
	//"ab#" is in dat
	d := New(17)
	d.base = []int{0, 1, 3, 0, 0, 2, 2, 0, 0}
	d.check = []int{0, 0, 1, 0, 0, 2, 5, 0, 6}

	success, state, depth := d.walkBykey("a")
	if !success || state != 2 || depth != 1 {
		t.Errorf("success: %v, state: %v, depth: %v", success, state, depth)
		t.Fail()
	}

	success, state, depth = d.walkBykey("b")
	if success || state != 1 || depth != 0 {
		t.Errorf("success: %v, state: %v, depth: %v", success, state, depth)
		t.Fail()
	}
}

func TestInsert(t *testing.T) {
	d := newWith_abSharp()

	d.insert("abc#")
	// d.insert2("ac#")

	r := d.ExactMatchSearch("ab#")
	if !r {
		t.Error("ab#")
	}
	r = d.ExactMatchSearch("abc#")
	if !r {
		t.Error("abc#")
	}

	t.Logf("Base:  %v", d.base)
	t.Logf("Check: %v", d.check)
}
