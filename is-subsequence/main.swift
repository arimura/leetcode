func isSubsequence(_ s: String, _ t: String) -> Bool {
    if s == "" {
        return true 
    }
    let sa = Array(s)
    let ta = Array(t)
    var saIdx = 0
    let l = sa.count
    for c in ta {
        if c == sa[saIdx] {
            saIdx += 1
        }
        if saIdx == l {
            return true
        } 
    }
    return false
}

let cases = [
  ("abc", "ahbgdc", true),
  ("axc", "ahbgdc", false),
  ("", "ahbgdc", false),
]

for c in cases {
  assert(isSubsequence(c.0, c.1) == c.2)
}
