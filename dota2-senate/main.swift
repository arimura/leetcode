class Solution {
  func predictPartyVictory(_ senate: String) -> String {
    let senateArray = Array(senate)
    var rQueue: [Int] = []
    var dQueue: [Int] = []
    for i in 0..<senateArray.count {
      if senateArray[i] == "R" {
        rQueue.append(i)
      } else {
        dQueue.append(i)
      }
    }
    var rQueueWinner: [Int] = []
    var dQueueWinner: [Int] = []
    while true {
      while !(rQueue.count == 0 && dQueue.count == 0) {
        // print("rQueue: \(rQueue)")
        // print("dQueue: \(dQueue)")
        // print("rQueueWinner: \(rQueueWinner)")
        // print("dQueueWinner: \(dQueueWinner)")
        if rQueue.count == 0 {
          if rQueueWinner.count > 0 {
            rQueueWinner.removeFirst()
          }
          dQueueWinner.append(dQueue[0])
          dQueue.removeFirst()
        } else if dQueue.count == 0 {
          if dQueueWinner.count > 0 {
            dQueueWinner.removeFirst()
          }
          rQueueWinner.append(rQueue[0])
          rQueue.removeFirst()
        } else if rQueue[0] < dQueue[0] {
          dQueue.removeFirst()
          rQueueWinner.append(rQueue[0])
          rQueue.removeFirst()
        } else {
          rQueue.removeFirst()
          dQueueWinner.append(dQueue[0])
          dQueue.removeFirst()
        }
      }
      if rQueueWinner.count > 0 && dQueueWinner.count > 0 {
        rQueue = rQueueWinner
        rQueueWinner = []
        dQueue = dQueueWinner
        dQueueWinner = []
      } else {
        break
      }
    }
    return rQueueWinner.count < dQueueWinner.count ? "Dire" : "Radiant"
  }
}

let cases = [
  // ("RD", "Radiant"),
  // ("RDD", "Dire"),
  //   ("DDRRR", "Dire")
  ("DRDRR", "Dire")
]

let s = Solution()
for c in cases {
  let r = s.predictPartyVictory(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
