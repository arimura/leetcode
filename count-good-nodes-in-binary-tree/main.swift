class Solution {
  func goodNodes(_ root: TreeNode?) -> Int {
    return traverse(root, root!.val)
  }

  func traverse(_ n: TreeNode?, _ m: Int) -> Int {
    if n!.left == nil && n!.right == nil {
      if m <= n!.val {
        return 1
      } else {
        return 0
      }
    }

    var c = 0
    var newMax = 0
    if m <= n!.val {
      c += 1
      newMax = n!.val
    } else {
      newMax = m
    }
    if n!.left != nil {
      c += traverse(n!.left, newMax)
    }
    if n!.right != nil {
      c += traverse(n!.right, newMax)
    }

    return c
  }
}

let cases = [
  ([3, 1, 4, 3, -1, 1, 5], 4),
  ([3, 3, -1, 4, 2], 3),
]
let s = Solution()
for c in cases {
  assert(s.goodNodes(treeNode(c.0)) == c.1, "c: \(c)")
}
