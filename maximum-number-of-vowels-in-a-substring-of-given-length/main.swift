func maxVowels(_ s: String, _ k: Int) -> Int {
  let cArray = Array(s)
  let len = cArray.count
  var num = 0
  if len <= k {
    for c in cArray {
      if isVowel(c) {
        num += 1
      }
    }
    return num
  }

  var numInW = 0
  var minIdxVowelInW = 0
  //first window
  minIdxVowelInW = isVowel(cArray[0]) ? 1 : 0
  for idxFW in 0..<k {
    if isVowel(cArray[idxFW]) {
      numInW += 1
    }
  }
  num = numInW

  var i = 1
  while true {
    if len <= i + k - 1 {
      break
    }
    numInW = numInW - minIdxVowelInW + (isVowel(cArray[i + k - 1]) ? 1 : 0)
    if num < numInW {
      num = numInW
    }

    minIdxVowelInW = isVowel(cArray[i]) ? 1 : 0
    i += 1
  }
  return num
}

func isVowel(_ c: Character) -> Bool {
  switch c {
  case "a", "e", "i", "u", "o":
    return true
  default:
    return false
  }
}

let cases = [
  ("abciiidef", 3, 3),
  ("aeiou", 2, 2),
  ("leetcode", 3, 2),
  ("weallloveyou", 7, 4),
  ("ibpbhixfiouhdljnjfflpapptrxgcomvnb", 33, 7),
]

for c in cases {
  let r = maxVowels(c.0, c.1)
  assert(r == c.2, "case: \(c), result: \(r)")
}
