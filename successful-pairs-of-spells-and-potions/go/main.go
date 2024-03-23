
func successfulPairs(spells []int, potions []int, success int64) []int {
	r := make([]int, len(spells))
	for _, spell := range spells {
		sorted := sort.Slice(portions, func(i, j int) bool {
			return i < j
		})
	}
}

// func findMin

type TestCase struct {
	spells  []int
	potions []int
	success int
	output  []int
}

func main(){
	cases := []TestCase{
		{
			spells: {5,1,3},
			potions: {1,2,3,4,5},
			success: 7,
			output: {4,0,3}
		}
	}
	for _, c := range cases {
		r := successfulPairs(c.spells, c.potions, c.success)
		if r != c.output {
			panic(fmt.Sprintf("c: %+v, r: %+v", c, r)
		}
	}
}