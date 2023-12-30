class Solution {
  func findCircleNum(_ isConnected: [[Int]]) -> Int {

  }
}

let cases = [
  ([[1, 1, 0], [1, 1, 0], [0, 0, 1]], 2),
  ([[1, 0, 0], [0, 1, 0], [0, 0, 1]], 3),
]
for c in cases {
  let s = Solution()
  let r = s.findCircleNum(c.0)
  assert(r == c.1, "c: \(c), r:\(r)")
}

