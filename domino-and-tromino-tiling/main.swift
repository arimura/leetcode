class Solution {
    //[i][0] = both cell empoty
    //[i][1] = filled and empty
    //[i][2] = empty and filled
    //[i][3] = both filled
    private var dp : [[Int]]!
    func numTilings(_ n: Int) -> Int {
        dp = Array(repeating: Array(repeating: 0, count: 4), count: n+1)
        dp[n][0] = 1
        for i in (0..<n).reversed() {
            //both empty
            dp[i][0] = dp[i+1][0] + dp[i+1][1] + dp[i+1][2] + dp[i+1][3]
            //filled and empty
            dp[i][1] = dp[i+1][2] + dp[i+1][3]
            //empty an filled
            dp[i][2] = dp[i+1][1] + dp[i+1][3]
            //both filled
            dp[i][3] = dp[i+1][0]
        }
        // print(dp)
        return dp[0][0]
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

