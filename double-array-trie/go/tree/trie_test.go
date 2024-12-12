package three

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	tr := New(30)
	tr.relocate(1, 1)
	// tr.relocate(2, 2)

	r, n := tr.walk(1, 'p')
	if !r {
		t.Fatalf("walk failed. s: %d, c: %c", 1, 'p')
	}
	if n != 2 {
		t.Fatalf("walk failed. s: %d, c: %c, n: %d", 1, 'p', n)
	}

	t.Logf("base: %v", tr.base)
	t.Logf("next: %v", tr.next)
	t.Logf("check: %v", tr.check)
}

func TestWalk(t *testing.T) {

}
