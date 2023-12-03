enum Element {
  case k(Int)
  case str(String)
  case leftBracket
  case rightBracket
}

func decodeString(_ s: String) -> String {
  var stack: [Element] = []
  var r = ""
  var tmp = ""
  var idx = 0
  let sArray = Array(s)
  while idx < sArray.count {
    if sArray[idx].isNumber {
      //process k
      while true {
        if !sArray[idx].isNumber {
          stack.append(Element.k(Int(tmp)!))
          tmp = ""
          break
        }
        tmp += String(sArray[idx])
        idx += 1
      }
    }

    if sArray[idx] == "[" {
      stack.append(Element.leftBracket)
      idx += 1
      continue
    }
    if sArray[idx] == "]" {
      //clsed
      if let l = stack.popLast(), case let Element.str(lastStr) = l {
        //remove leftBracket
        stack.removeLast()
        //get k
        if let l = stack.popLast(), case let Element.k(k) = l {
          let multipled = String(repeating: lastStr, count: k)
          if stack.count == 0 {
            r += multipled
            idx += 1
            continue
          } else {
            if let l = stack.popLast(), case let Element.str(lastStr) = l {
              stack.append(Element.str(lastStr + multipled))
              idx += 1
              continue
            }
          }
        }
      }
      idx += 1
      continue
    }
    if sArray[idx].isLetter {
      while true {
        if sArray.count <= idx  || !sArray[idx].isLetter {
          if stack.count == 0 {
            r += tmp
            tmp = ""
            break
          }
          stack.append(Element.str(tmp))
          tmp = ""
          break
        }
        tmp += String(sArray[idx])
        idx += 1
      }
    }
  }
  return r 
}

let cases = [
  ("3[a]2[bc]", "aaabcbc"),
  ("3[a2[c]]", "accaccacc"),
  ("2[abc]3[cd]ef", "abcabccdcdcdef"),
]

for c in cases {
  let r = decodeString(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
