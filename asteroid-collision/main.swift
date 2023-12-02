func asteroidCollision(_ asteroids: [Int]) -> [Int] {
  var r: [Int] = []
  var i = 0
  while true {
    if asteroids.count <= i {
      break
    }
    let a = asteroids[i]

    if let last = r.last {
      let islastResultMinus = last < 0
      if islastResultMinus {
        r.append(a)
        i += 1
        continue
      }

      //last element go to right(0 < last elemtn)
      //a go right
      if 0 < a {
        r.append(a)
        i += 1
        continue
      }
      //a go left
      //last is bigger
      if a + last > 0 {
        //last go next
        i += 1
        continue
      }
      //same size
      if a + last == 0 {
        r.removeLast()
        i += 1
        continue
      }
      //a is bigger
      r.removeLast()
    } else {
      r.append(a)
      i += 1
    }
  }
  return r
}

let cases = [
  ([5, 10, -5], [5, 10]),
  ([8, -8], []),
  ([10, 2, -5], [10]),
]

for c in cases {
  let r = asteroidCollision(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
