class Solution {
    func rob(_ nums: [Int]) -> Int {
        
    }
}

let cases = [
    ([1,2,3,1], 4),
    ([2,7,9,3,1], 12)
]

let s = Solution()
for c in cases {
    let r = s.rob(c.0)
    assert(r == c.1, "c: \(c), r: \(r)")
}
