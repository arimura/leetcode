package main

import "testing"

func TestBase(t *testing.T) {
	i := []int{2, 7, 9, 3, 1}
	if 12 != rob(i) {
		t.Errorf("i: %+v", i)
	}
}
