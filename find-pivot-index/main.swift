func pivotIndex(_ nums: [Int]) -> Int {
  var rightTotal = nums[1...].reduce(0, { r, e in return r + e })
  if rightTotal == 0 {
    return 0
  }

  var leftTotal = 0
  for i in 1..<nums.count {
    leftTotal += nums[i - 1]
    rightTotal -= nums[i]
    if leftTotal == rightTotal {
      return i
    }
  }
  return -1

}

let cases = [
  ([1, 7, 3, 6, 5, 6], 3),
  ([1, 2, 3], -1),
  ([2, 1, -1], 0),
]
for c in cases {
  let r = pivotIndex(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
