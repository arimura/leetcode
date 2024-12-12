package three

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	tr := New(30)
	tr.relocate(1, 1)

	t.Logf("base: %v", tr.base)
	t.Logf("next: %v", tr.next)
	t.Logf("check: %v", tr.check)
}

func TestWalk(t *testing.T) {

}
