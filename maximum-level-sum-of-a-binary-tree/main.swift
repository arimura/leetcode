class Solution {
  var sums: [Int] = []
  func maxLevelSum(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    traverse(root, 0)

    var m = sums[0]
    var mi = 0
    for (i, sum) in sums.enumerated() {
      if m < sum {
        m = sum
        mi = i
      }
    }
    return mi + 1
  }

  func traverse(_ n: TreeNode?, _ depth: Int) {
    if sums.count <= depth {
      sums.append(0)
    }

    sums[depth] += n!.val

    if n!.left != nil {
      traverse(n!.left, depth + 1)
    }

    if n!.right != nil {
      traverse(n!.right, depth + 1)
    }
  }
}

let cases = [
  ([1, 7, 0, 7, -8, nil, nil], 2),
  ([989, nil, 10250, 98693, -89388, nil, nil, nil, -32127], 2),
]

for c in cases {
  let s = Solution()
  let r = s.maxLevelSum(treeNode(c.0))
  assert(r == c.1, "c: \(c), r: \(r)")
}
