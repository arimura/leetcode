package three

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	tr := New(30)

	r := tr.insertTransitions(1, 1, &[]transition{{next: 2, c: 'p'}})
	if !r {
		t.Fatalf("failed to insert s: %d, b: %d", 1, 1)
	}

	t.Logf("base: %v", tr.base)
	t.Logf("next: %v", tr.next)
	t.Logf("check: %v", tr.check)

	assertWalk(1, 'p', true, 2, tr, t)
}

func assertWalk(s int, c rune, r bool, n int, tr *ThreeArrayTrie, t *testing.T) {
	ar, an := tr.walk(s, c)
	if ar != r || an != n {
		t.Fatalf("failed to walk s: %d, c: %c, r: %t, n: %d, ar: %t, an: %d", s, c, r, n, ar, an)
	}
}

func TestWalk(t *testing.T) {

}
