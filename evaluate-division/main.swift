class Solution {
  func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double]
  {

  }
}

let cases = [
  (
    [["a", "b"], ["b", "c"]], [2.0, 3.0],
    [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]],
    [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]
  ),
  (
    [["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0],
    [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]], [3.75000, 0.40000, 5.00000, 0.20000]
  ),
  (
    [["a", "b"]], [0.5], [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]],
    [0.50000, 2.00000, -1.00000, -1.00000]
  ),
]
let s = Solution()
for c in cases {
  let r = c.calcEquation(c.0, c.1, c.2)
  assert(r == c.3, "c: \(c), r: \(r)")
}
