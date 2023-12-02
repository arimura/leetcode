func equalPairs(_ grid: [[Int]]) -> Int {
  let len = grid.count
  var rowDic: [String: Int] = [:]
  var colDic: [String: Int] = [:]

  for i in 0..<len {
    let rowStr = grid[i].reduce("", { a, e in a + "-" + String(e) })
    if let v = rowDic[rowStr] {
      rowDic[rowStr] = v + 1
    } else {
      rowDic[rowStr] = 1
    }

    var colStr = ""
    for colIdx in 0..<len {
      colStr = colStr + "-" + String(grid[colIdx][i])
    }
    if let v = colDic[colStr] {
      colDic[colStr] = v + 1
    } else {
      colDic[colStr] = 1
    }
  }
  var cnt = 0
  for (k, rv) in rowDic {
    if let cv = colDic[k] {
      cnt += rv * cv
    }
  }
  return cnt
}

let cases = [
  ([[3, 2, 1], [1, 7, 6], [2, 7, 7]], 1),
  ([[3, 1, 2, 2], [1, 4, 4, 5], [2, 4, 2, 2], [2, 4, 2, 2]], 3),
]

for c in cases {
  let r = equalPairs(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
