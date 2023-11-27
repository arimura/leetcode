func largestAltitude(_ gain: [Int]) -> Int {
  var h = 0
  var s = 0
  for g in gain {
    s = s + g
    h = max(h, s)
  }
  return h
}

let cases = [
  ([-5, 1, 5, 0, -7], 1),
  ([-4, -3, -2, -1, 4, 3, 2], 0),
]

for c in cases {
  let r = largestAltitude(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
