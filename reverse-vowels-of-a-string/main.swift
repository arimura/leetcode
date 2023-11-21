func reverseVowels(_ s: String) -> String {
  var sArray = Array(s)
  let len = sArray.count
  var startIdx = 0
  var endIdx = len - 1
  var isEnd = false
  while true {
    while true {
      if startIdx == endIdx {
        isEnd = true
        break
      }

      if isVowels(sArray[startIdx]) {
        break
      }
      startIdx += 1
    }

    while true {
      if startIdx == endIdx {
        isEnd = true
        break
      }
      if isVowels(sArray[endIdx]) {
        break
      }
      endIdx -= 1
    }

    if !isEnd {
      let tmp = sArray[endIdx]
      sArray[endIdx] = sArray[startIdx]
      sArray[startIdx] = tmp
    } else {
      break
    }
    startIdx += 1
    endIdx += -1
    if endIdx <= startIdx {
      break
    }

  }

  return String(sArray)
}

func isVowels(_ c: Character) -> Bool {
  switch c {
  case "a", "A", "e", "E", "i", "I", "o", "O", "u", "U":
    return true
  default:
    return false
  }
}

print(reverseVowels("leetcode"))
