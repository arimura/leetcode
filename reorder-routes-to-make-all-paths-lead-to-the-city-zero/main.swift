class Solution {
  var conList: [[Int]]?
  func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    conList = connections
    var nextCities: [(Int, Int)] = [(0, 0)]
    var checkedCities: [(Int, Int)] = []

    while !nextCities.isEmpty {
      let nextCity = nextCities.removeFirst()
      let nexts = removeCon(nextCity.0)

      checkedCities.append(nextCity)
      nextCities.append(contentsOf: nexts)
    }

    print(checkedCities)
    return checkedCities.reduce(0, { r, e in r + e.1 })
  }

  func removeCon(_ targetCity: Int) -> [(Int, Int)] {
    var tmpConList: [[Int]] = []
    var r: [(Int, Int)] = []
    for city in conList! {
      if city[1] == targetCity {
        r.append((city[0], 0))
        continue
      }
      if city[0] == targetCity {
        r.append((city[1], 1))
        continue
      }
      tmpConList.append(city)
    }
    conList = tmpConList
    return r
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
