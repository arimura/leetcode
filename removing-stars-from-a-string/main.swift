func removeStars(_ s: String) -> String {
  var r: [Character] = []
  for c in s {
    if c != "*" {
      r.append(c)
      continue
    }
    if r.count > 0 {
      r.removeLast()
    }
  }
  return String(r)
}

let cases = [
  ("leet**cod*e", "lecoe"),
  ("erase*****", ""),
]

for c in cases {
  let r = removeStars(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
