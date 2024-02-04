class Solution {
    func numTilings(_ n: Int) -> Int {
        
    }
}

let cases = [
    (3, 5),
    (1, 1),
]

for c in cases {
    let s = Solution()
    let r = s.numTilings(c.0)
    assert(r == c.1, "c: \(c), r: \(r)")
}

