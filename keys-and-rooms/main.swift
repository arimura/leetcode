class Solution {
  func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
    var visited = [Bool](repeating: false, count: rooms.count)
    var keys = Set<Int>()
    guard let keyFromZero = rooms.first else {
      return false
    }
    _ = keyFromZero.map { keys.insert($0) }
    visited[0] = true
    while keys.count != 0 {
      var newKeys = Set<Int>()
      for k in keys {
        visited[k] = true
        for keyInRoom in rooms[k] {
          if !visited[keyInRoom] {
            newKeys.insert(keyInRoom)
          }
        }
      }
      keys = newKeys
    }
    for v in visited {
      if !v {
        return false
      }
    }
    return true
  }
}

let cases = [
  ([[1], [2], [3], []], true),
  ([[1, 3], [3, 0, 1], [2], [0]], false),
]

let s = Solution()
for c in cases {
  let r = s.canVisitAllRooms(c.0)
  assert(r == c.1, "c: \(c)")
}
