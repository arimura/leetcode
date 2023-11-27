func longestSubarray(_ nums: [Int]) -> Int {
  var l = 0
  var r = 0
  var c = 0
  let len = nums.count
  var dlt = false
  var dltL = 0
  var dltOnce = false
  while true {
    if len <= r {
      break
    }
    if nums[r] == 1 {
      let dltCnt = dlt ? -1 : 0
      c = max(c, 1 + r - l + dltCnt)
      r += 1
      continue
    }
    if nums[r] == 0 {
      if dlt == false {
        dlt = true
        dltOnce = true
        r += 1
        dltL = r
        continue
      }
      if dlt == true {
        l = dltL
        dlt = false
      }
    }
  }
  if !dltOnce {
    c -= 1
  }
  return c
}

let cases = [
  ([1, 1, 0, 1], 3),
  ([0, 1, 1, 1, 0, 1, 1, 0, 1], 5),
  ([1, 1, 1], 2),
]

for c in cases {
  let r = longestSubarray(c.0)
  assert(r == c.1, "c: \(c), result: \(r)")
}
