package main

import "fmt"

var pick int

func guessNumber(n int) int {
	l := 1
	r := n
	c := (r - l) / 2
	for true {
		g := guess(c)
		if g == 0 {
			return c
		} else if g == -1 {
			r = c
			c = (r-l)/2 + l
			if c == l {
				return l
			}
			continue
		}
		l = c
		c = (r-l)/2 + l
		if c == l {
			return r
		}
	}
	return c
}

func guess(num int) int {
	if pick < num {
		return -1
	} else if pick > num {
		return 1
	}
	return 0
}

type TestCase struct {
	n    int
	pick int
}

func main() {
	cases := []TestCase{
		{
			n:    10,
			pick: 6,
		},
		{
			n:    1,
			pick: 1,
		},
		{
			n:    2,
			pick: 1,
		},
	}
	for _, c := range cases {
		pick = c.pick
		r := guessNumber(c.n)
		if r != c.pick {
			panic(fmt.Sprintf("c: %+v, r:%d", c, r))
		}
	}
}
