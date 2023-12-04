class RecentCounter {
  var list: [Int] = []

  func ping(_ t: Int) -> Int {
    list.insert(t, at: 0)
    for i in 0..<list.count {
      if t - list[i] > 3000 {
        list = Array(list[0..<i])
        break
      }
    }
    return list.count
  }
}

let c = RecentCounter()
assert(c.ping(642) == 1)
assert(c.ping(1849) == 2)
assert(c.ping(4921) == 3)
// assert(c.ping(5936) == 3)
// assert(c.ping(5957) == 3)
