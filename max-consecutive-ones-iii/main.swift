func longestOnes(_ nums: [Int], _ k: Int) -> Int {
  let len = nums.count
  var i = 0
  var cnt = 0
  while true {
    if len <= i {
      break
    }

    //count
    var tmpCnt = 0
    var tmpIdx = i
    var tmpK = k
    while true {
      if len <= tmpIdx {
        break
      }
      if nums[tmpIdx] == 1 {
        //go next
        tmpCnt += 1
        tmpIdx += 1
        continue
      }
      if nums[tmpIdx] == 0 {
        //check tmpK
        if 0 < tmpK {
          //go next
          tmpCnt += 1
          tmpIdx += 1
          tmpK -= 1
          continue
        }
        // no tmkK
        break
      }
    }
    cnt = max(cnt, tmpCnt)
    i += 1
  }
  return cnt
}

let cases = [
  ([0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1], 3, 10),
  ([1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0], 2, 6),
]

for c in cases {
  let r = longestOnes(c.0, c.1)
  assert(r == c.2, "case: \(c), result: \(r)")
}
