func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
  let len = nums.count
  var m = Int.min
  if len <= k {
    m = nums.reduce(
      0,
      { sum, n in
        return sum + n
      })
    return Double(m) / Double(k)
  }
  var i = 0
  while true {
    if len < (i + k) {
      break
    }
    let tmp = (i..<(i + k)).reduce(0, { sum, subi in return sum + nums[subi] })
    if m < tmp {
      m = tmp
    }
    i += 1
  }
  return Double(m) / Double(k)
}

let cases = [
  ([1, 12, -5, -6, 50, 3], 4, 12.75000),
  ([5], 1, 5),
]

for c in cases {
  print(findMaxAverage(c.0, c.1))
}
