package double

import (
	"testing"
)

func TestExactMatchSearch(t *testing.T) {
	d := New(17)
	d.base = []int{0, 1, 3, 0, 0, 2, 2, 0, 0}
	d.check = []int{0, 0, 1, 0, 0, 2, 5, 0, 6}

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
	d := New(17)
	d.base = []int{0, 1, 3, 0, 0, 2, 2, 0, 0}
	d.check = []int{0, 0, 1, 0, 0, 2, 5, 0, 6}

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

func TestInsert(t *testing.T) {
	d := New(17)
	d.insert(1, "ab")

	r := d.ExactMatchSearch("ab")
	if !r {
		t.Errorf("Base:  %v", d.base)
		t.Errorf("Check: %v", d.check)
	}
}
