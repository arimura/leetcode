package three

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	tr := New(30)
	tr.insert(1, 1, 'p', 2)
	tr.insert(2, 2, 'o', 3)

	assertWalk(1, 'p', true, 2, tr, t)
	// assertWalk(2, 'o', true, 3, tr, t)

	t.Logf("base: %v", tr.base)
	t.Logf("next: %v", tr.next)
	t.Logf("check: %v", tr.check)
}

func assertWalk(s int, c rune, r bool, n int, tr *ThreeArrayTrie, t *testing.T) {
	ar, an := tr.walk(s, c)
	if ar != r {
		t.Fatalf("failed s: %d, c: %c, r: %t", s, c, r)
	}
	if an != n {
		t.Fatalf("failed s: %d, c: %c, r: %t", s, c, r)
	}
}

func TestWalk(t *testing.T) {

}
