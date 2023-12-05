class Solution {
  func predictPartyVictory(_ senate: String) -> String {
    let senateArray = Array(senate)
    var rQueue: Array<Int> = []
    var dQueue: Array<Int> = []
    for i in 0..<senateArray.count {
        if senateArray[i] == "R" {
           rQueue.append(i) 
        } else{
            dQueue.append(i)
        } 
    }
    while rQueue.count > 0 && dQueue.count > 0 {
        if rQueue[0] < dQueue[0]{
            dQueue.removeFirst()
        }else{
            rQueue.removeFirst()
        }
    }
    return rQueue.count < dQueue.count ? "Dire" : "Radiant" 
  }
}

let cases = [
  ("RD", "Radiant"),
  ("RDD", "Dire"),
]

let s = Solution()
for c in cases {
  let r = s.predictPartyVictory(c.0)
  assert(r == c.1, "c: \(c), r: \(r)")
}
