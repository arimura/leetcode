func maxArea(_ height: [Int]) -> Int {
  var lCnds: [(Int, Int)] = []
  var rCnds: [(Int, Int)] = []
  let lenHeight = height.count

  lCnds.append((0, height[0]))
  for i in 1..<lenHeight {
    let last = lCnds.last!
    if last.1 < height[i] {
      lCnds.append((i, height[i]))
    }
  }
  rCnds.append((lenHeight - 1, height[lenHeight - 1]))
  for i in (1..<lenHeight).reversed() {
    let last = rCnds.last!
    if last.1 < height[i] {
      rCnds.append((i, height[i]))
    }
  }

  var m = 0
  for lCnd in lCnds {
    for rCnd in rCnds {
      if lCnd.0 >= rCnd.0 {
        continue
      }
      let water = (rCnd.0 - lCnd.0) * min(rCnd.1, lCnd.1)
      if m < water {
        m = water
      }
    }
  }

  return m
}

let cases = [
  ([1, 8, 6, 2, 5, 4, 8, 3, 7], 49),
  ([1,1],1),
]

for c in cases {
  assert(maxArea(c.0) == c.1)
}
