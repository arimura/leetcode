class Frame: CustomStringConvertible {
  var number: Int = 0
  var text: String = ""
  init(number: Int) {
    self.number = number
  }
  func val() -> String {
    return String(repeating: text, count: number)
  }
  var description: String {
    return "Frame numner: \(number), text: \(text)"
  }
}

func decodeString(_ s: String) -> String {
  var frameStack: [Frame] = []
  var tmpNum = ""
  var result = ""
  let sArray = Array(s)
  for c in sArray {
    if c.isNumber {
      tmpNum += String(c)
      continue
    }

    if c == "[" {
      frameStack.append(Frame(number: Int(tmpNum)!))
      tmpNum = ""
      continue
    }

    if c == "]" {
      let lastFrame = frameStack.popLast()!
      if frameStack.count == 0 {
        result += lastFrame.val()
        continue
      }
      frameStack[frameStack.count - 1].text += lastFrame.val()
      continue
    }

    if c.isLetter {
      if frameStack.count == 0 {
        result += String(c)
        continue
      }
      frameStack[frameStack.count - 1].text += String(c)
      continue
    }
  }
  return result
}

let cases = [
  ("3[a]2[bc]", "aaabcbc"),
  ("3[a2[c]]", "accaccacc"),
  ("2[abc]3[cd]ef", "abcabccdcdcdef"),
  ("3[z]2[2[y]pq4[2[jk]e1[f]]]ef", "zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef"),
]

for c in cases {
  let r = decodeString(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
