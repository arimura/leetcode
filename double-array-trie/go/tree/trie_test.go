package three

import (
	"testing"
)

func TestRelocate(t *testing.T) {
	// Initialize the trie with some values
	c := 30
	base = make([]int, c)
	next = make([]int, c)
	check = make([]int, c)

	// Test case: Relocate node
	relocate(1, 1)

	t.Logf("base: %v", base)
	t.Logf("next: %v", next)
	t.Logf("check: %v", check)
}

func TestWalk(t *testing.T) {

}
