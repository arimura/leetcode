class Solution {
  var provinces: [Set<Int>] = []
  var checked: Set<Int> = Set()
  func findCircleNum(_ isConnected: [[Int]]) -> Int {

    for city in 0..<isConnected.count {
      if checked.contains(city) {
        continue
      }
      provinces.append(connected(city: city, isConnected: isConnected))
    }
    return provinces.count
  }

  func connected(city: Int, isConnected: [[Int]]) -> Set<Int> {
    checked.insert(city)
    var connectedCites = Set<Int>()
    for (city, val) in isConnected[city].enumerated() {
      if val == 0 || checked.contains(city) {
        continue
      }
      connectedCites.formUnion(connected(city: city, isConnected: isConnected))
    }
    return connectedCites
  }
}

let cases = [
  ([[1, 1, 0], [1, 1, 0], [0, 0, 1]], 2),
  ([[1, 0, 0], [0, 1, 0], [0, 0, 1]], 3),
  ([[1, 0, 0, 1], [0, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1]], 1),
]

for c in cases {
  let s = Solution()
  let r = s.findCircleNum(c.0)
  assert(r == c.1, "c: \(c), r:\(r)")
}
