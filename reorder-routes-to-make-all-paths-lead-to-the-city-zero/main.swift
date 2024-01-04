class City {
  let number: Int
  var outgoingCities: [City] = []
  var incomingCities: [City] = []
  init(number: Int) {
    self.number = number
  }
}

class Solution {
  var cnt = 0
  func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    var dic: [Int: City] = [:]
    var zeroCity: City?
    for con in connections {
      var startCity = dic[con[0]] ?? City(number: con[0])
      var endCity = dic[con[1]] ?? City(number: con[1])
      startCity.outgoingCities.append(endCity)
      endCity.incomingCities.append(startCity)
      dic[con[0]] = startCity
      dic[con[1]] = endCity
      if startCity.number == 0 {
        zeroCity = startCity
      }
      if endCity.number == 0 {
        zeroCity = endCity
      }
    }
    dfs(zeroCity!, zeroCity!.number)
    return self.cnt
  }

  private func dfs(_ city: City, _ fromNumber: Int) {
    for incomingCity in city.incomingCities {
      if incomingCity.number == fromNumber {
        continue
      }
      dfs(incomingCity, city.number)
    }
    for outgoingCity in city.outgoingCities {
      if outgoingCity.number == fromNumber {
        continue
      }
      self.cnt += 1
      dfs(outgoingCity, city.number)
    }
  }
}

let cases = [
  (6, [[0, 1], [1, 3], [2, 3], [4, 0], [4, 5]], 3),
  (5, [[1, 0], [1, 2], [3, 2], [3, 4]], 2),
  (3, [[1, 0], [2, 0]], 0),
  (6, [[0, 2], [0, 3], [4, 1], [4, 5], [5, 0]], 3),
]

for c in cases {
  let s = Solution()
  let r = s.minReorder(c.0, c.1)
  assert(r == c.2, "c: \(c), r: \(r)")
}
