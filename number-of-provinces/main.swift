class Solution {
  var visited: [[Bool]]?
  var rowL: Int?
  var colL: Int?
  var count: Int?
  func findCircleNum(_ isConnected: [[Int]]) -> Int {
    rowL =  isConnected.count
    colL =  isConnected[0].count
    count = colL * rowL
    visited = Array(repeating:Array(repeating: false, count:colL), count: rowL)
  }

  func traverse(_ row: Int, _ col: Int){
    if visited[row][col] {
        return
    }
    visited[row][col] = true
    count -= 1
    
    //go left
    if col != 0 {
        traverse(row, col - 1)
    }
    //go right
    if col < colL - 1 {
        traverse(row, col + 1)
    }
    //go up
    if row != 0 {
        traverse(row + 1, col)
    }
    //go down
    if row < rowL - 1 {
        traverse(row - 1, col)
    }
  }
}

let cases = [
  ([[1, 1, 0], [1, 1, 0], [0, 0, 1]], 2),
  ([[1, 0, 0], [0, 1, 0], [0, 0, 1]], 3),
]

for c in cases {
  let s = Solution()
  let r = s.findCircleNum(c.0)
  assert(r == c.1, "c: \(c), r:\(r)")
}

