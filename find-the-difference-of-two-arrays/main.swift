func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
  var num1Set: Set<Int> = []
  var num2Set: Set<Int> = []
  for n in nums1 {
    if !num1Set.contains(n) { num1Set.insert(n) }
  }
  for n in nums2 {
    if !num2Set.contains(n) { num2Set.insert(n) }
  }

  var distNum1: [Int] = []
  for n in num1Set {
    if !num2Set.contains(n) {
      distNum1.append(n)
    }
  }

  var distNum2: [Int] = []
  for n in num2Set {
    if !num1Set.contains(n) {
      distNum2.append(n)
    }
  }

  return [distNum1, distNum2]
}

let cases = [
  ([1, 2, 3], [2, 4, 6], [[1, 3], [4, 6]]),
  ([1, 2, 3, 3], [1, 1, 2, 2], [[3], []]),
]

for c in cases {
  let r = findDifference(c.0, c.1)
  assert(r == c.2, "c: \(c), r: \(r)")
}
