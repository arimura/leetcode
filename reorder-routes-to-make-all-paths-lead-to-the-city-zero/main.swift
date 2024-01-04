class Solution {
    var matrix: [[Bool]] = []
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var nextSet: Set<Int> = [0]
        var reversed = 0
        for _ in 0...n {
            matrix.append(Array(repeating: false, count: n))
        }
        for c in connections {
            matrix[c[0]][c[1]] = true
        }

        while nextSet.isEmpty == false {
          let next = nextSet.removeFirst()

          //direct
          for (rowI, row) in matrix.enumerated() {
            if (row[next]){
                nextSet.insert(rowI)
                matrix[rowI][next] = false
            }
          }
          //reversed
          for (colI, cols) in matrix[next].enumerated(){
            if(cols) {
                nextSet.insert(colI)
                reversed += 1
                matrix[next][colI] = false 
            }
          }
        }

        return reversed 
    }
}

let cases = [
  (6, [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]], 3),
  (5, [[1, 0], [1, 2], [3, 2], [3, 4]], 2),
  (3, [[1, 0], [2, 0]], 0),
]

for c in cases {
  let s = Solution()
  let r = s.minReorder(c.0, c.1)
  assert(r == c.2, "c: \(c), r: \(r)")
}
