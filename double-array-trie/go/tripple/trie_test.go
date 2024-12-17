package tripple

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	tr := New(30)

	assertInsert(1, 1, &[]transition{{next: 2, c: 'p'}}, true, tr, t)
	assertInsert(2, 2, &[]transition{
		{next: 3, c: 'o'},
		{next: 6, c: 'r'},
	}, true, tr, t)
	assertInsert(3, 3, &[]transition{{next: 4, c: 'o'}}, true, tr, t)

	t.Logf("base: %v", tr.base)
	t.Logf("next: %v", tr.next)
	t.Logf("check: %v", tr.check)

	assertWalk(1, 'p', true, 2, tr, t)
	assertWalk(2, 'o', true, 3, tr, t)
	assertWalk(3, 'o', true, 4, tr, t)
	assertWalk(2, 'r', true, 6, tr, t)
}

func assertInsert(s, b int, ts *[]transition, er bool, tr *ThreeArrayTrie, t *testing.T) {
	ar := tr.insertTransitions(s, b, ts)
	if ar != er {
		t.Fatalf("failed to insert s: %d, b: %d", s, b)
	}
}

func assertWalk(s int, c rune, r bool, n int, tr *ThreeArrayTrie, t *testing.T) {
	ar, an := tr.walk(s, c)
	if ar != r || an != n {
		t.Fatalf("failed to walk s: %d, c: %c, r: %t, n: %d, ar: %t, an: %d", s, c, r, n, ar, an)
	}
}

func TestWalk(t *testing.T) {

}
