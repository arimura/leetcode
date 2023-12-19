class Solution {
  func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
    if root == nil {
      return 0
    }
    return pathSum(root, targetSum, [])
  }

  func pathSum(_ n: TreeNode?, _ sum: Int, _ vArray: [Int]) -> Int {
    var array = vArray
    array.append(n!.val)
    var lSumNum = 0
    if n?.left != nil {
      lSumNum = pathSum(n?.left, sum, array)
    }
    var rSumNum = 0
    if n?.right != nil {
      rSumNum = pathSum(n?.right, sum, array)
    }

    var cnt = 0
    var combi = 0
    for e in array.reversed() {
      combi += e
      if combi == sum {
        cnt += 1
      }
    }
    return lSumNum + rSumNum + cnt
  }
}

let cases = [
  ([10, 5, -3, 3, 2, nil, 11, 3, -2, nil, 1], 8, 3),
  ([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, 5, 1], 22, 3),
]

let s = Solution()
for c in cases {
  let r = s.pathSum(treeNode(c.0), c.1)
  assert(r == c.2, "c: \(c), r: \(r)")
}
