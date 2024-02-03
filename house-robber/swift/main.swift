class Solution {
    //[i][0=rob, 1=no rob] 
    private var dp :[[Int]]!
    func rob(_ nums: [Int]) -> Int {
        dp = Array(repeating: Array(repeating: 0, count: 2), count: nums.count + 1)
        for i in (0..<nums.count).reversed() {
            dp[i][0] = dp[i+1][1] + nums[i]
            dp[i][1] = dp[i+1][0] < dp[i+1][1] ? dp[i+1][1] : dp[i+1][0]
        } 
        return dp[0][0] < dp[0][1] ? dp[0][1] : dp[0][0]
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
