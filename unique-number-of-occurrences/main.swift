func uniqueOccurrences(_ arr: [Int]) -> Bool {
  var d: [Int: Int] = [:]
  for e in arr {
    if let v = d[e] {
      d[e] = v + 1
    } else {
      d[e] = 1
    }
  }
  var s = Set<Int>()
  for (_, v) in d {
    if s.contains(v) {
      return false
    }
    s.insert(v)
  }
  return true
}

let cases = [
  ([1, 2, 2, 1, 1, 3], true),
  ([1, 2], false),
  ([-3, 0, 1, -3, 1, 1, 1, -3, 10, 0], true),
]

for c in cases {
  let r = uniqueOccurrences(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
