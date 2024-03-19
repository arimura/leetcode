package main

var pick int

func guessNumber(n int) int {
	m := n
	t := n / 2

	for true {
		g := guess(t)
		if g == 0 {
			return t
		} else if g == -1 {
			t = t / 2
			continue
		}
		t
	}
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
			panic(c)
		}
	}
}
