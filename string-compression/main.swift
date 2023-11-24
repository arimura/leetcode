func compress(_ chars: inout [Character]) -> Int {
  var t: Character = " "
  var cnt = 0
  var charsIdx = 0
  for c in chars {
    if t == " " {
      t = c
      cnt = 1
      continue
    }
    if t == c {
      cnt += 1
      continue
    }
    if t != c {
      //char change
      chars[charsIdx] = t
      charsIdx += 1
      if cnt != 1 {
        let cmprs = Array(String(cnt))
        for cmprsC in cmprs {
          chars[charsIdx] = cmprsC
          charsIdx += 1
        }
      }

      t = c
      cnt = 1
      continue

    }
  }
  chars[charsIdx] = t
  charsIdx += 1
  if cnt != 1 {
    let cmprs = Array(String(cnt))
    for cmprsC in cmprs {
      chars[charsIdx] = cmprsC
      charsIdx += 1
    }
  }

  chars.removeSubrange(charsIdx...)

  return chars.count

}

var chars: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
print(compress(&chars))
print(chars)
