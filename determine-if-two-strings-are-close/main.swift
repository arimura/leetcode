func closeStrings(_ word1: String, _ word2: String) -> Bool {
  //use dic to count chars
  var w1Dic: [Character: Int] = [:]
  var w1Vals: [Int] = []
  var w1Char = Set<Character>()
  var w2Dic: [Character: Int] = [:]
  var w2Vals: [Int] = []
  var w2Char = Set<Character>()

  for c in word1 {
    if let v = w1Dic[c] {
      w1Dic[c] = v + 1
    } else {
      w1Dic[c] = 1
    }
  }
  w1Vals = Array(w1Dic.values).sorted()
  w1Char = Set(w1Dic.keys)

  for c in word2 {
    if let v = w2Dic[c] {
      w2Dic[c] = v + 1
    } else {
      w2Dic[c] = 1
    }
  }
  w2Vals = Array(w2Dic.values).sorted()
  w2Char = Set(w2Dic.keys)

  return w1Vals == w2Vals && w1Char == w2Char
}

let cases = [
  ("abc", "bca", true),
  ("a", "aa", false),
  ("cabbba", "abbccc", true),
  ("uau", "ssx", false),
]

for c in cases {
  let r = closeStrings(c.0, c.1)
  assert(r == c.2, "c:\(c), r:\(r)")
}
