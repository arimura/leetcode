func maxOperations(_ nums: [Int], _ k: Int) -> Int {
  let srtd = nums.sorted()
  var l = 0
  var r = nums.count - 1
  var c = 0
  while true {
    if r <= l {
      break
    }
    if k < srtd[r] {
      r -= 1
      continue
    }
    let dif = k - srtd[r]
    while true {
      if r <= l {
        break
      }
      let lv = srtd[l]
      if dif > lv {
        l += 1
        continue
      }
      if dif == lv {
        c += 1
        r -= 1
        l += 1
        break
      }
      if dif < lv {
        r -= 1
        break
      }
    }
  }
  return c
}

let cases = [
  ([1, 2, 3, 4], 5, 2),
  ([3, 1, 3, 4, 3], 6, 1),
]

for c in cases {
  assert(maxOperations(c.0, c.1) == c.2)
}
