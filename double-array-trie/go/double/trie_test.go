package double

import (
	"testing"
)

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
