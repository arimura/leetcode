package main

var pick int

func guessNumber(n int) int {

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
