class Solution {
  var provinces: [Set<Int>] = []
  func findCircleNum(_ isConnected: [[Int]]) -> Int {

    for (rowIdx, connectedCitesForCity) in isConnected.enumerated() {
      for (colIdx, connectedCityForCity) in connectedCitesForCity.enumerated() {
        if 0 == connectedCityForCity {
          continue
        }
        var inExistingProvince = false
        for i in 0..<provinces.count {
          var province = provinces[i]
          let rowInProvince = province.contains(rowIdx)
          let colInProvince = province.contains(colIdx)
          if rowInProvince || colInProvince {
            province.insert(colIdx)
            province.insert(rowIdx)
            inExistingProvince = true
          }
          provinces[i] = province
        }
        if !inExistingProvince {
            print(rowIdx)
            print(colIdx)
          provinces.append(Set([rowIdx, colIdx]))
        }
      }
    }
    return provinces.count
  }
}

let cases = [
//   ([[1, 1, 0], [1, 1, 0], [0, 0, 1]], 2),
//   ([[1, 0, 0], [0, 1, 0], [0, 0, 1]], 3),
  ([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]], 1),
]

for c in cases {
  let s = Solution()
  let r = s.findCircleNum(c.0)
  assert(r == c.1, "c: \(c), r:\(r)")
}
