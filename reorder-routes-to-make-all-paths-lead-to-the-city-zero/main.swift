class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        
    }
}

let cases = [
(6,[[0,1],[1,3],[2,3],[4,0],[4,5]], 3),
(5,[[1,0],[1,2],[3,2],[3,4]], 2),
(3,[[1,0],[2,0]], 0),
]

for c in cases {
    let s = Solution()
    let r = s.minReorder(c.0, c.1)
    assert(r == c.2, "c: \(c), r: \(r)")
} 