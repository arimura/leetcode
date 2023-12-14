class Solution {
  func goodNodes(_ root: TreeNode?) -> Int {
    return traverse(root, root!.val)
  }

  func traverse(_ n: TreeNode?, m: Int) -> Int {
    if n!.left == nil && n!.right == nil {
      if m <= n!.val {
        return 1
      } else {
        return 0
      }
    }

    let newMax = n!.val < m ? m : n!.val
    var c = 0
    if n!.left == nil {
      c += traverse(n!.left, newMax)
    }
    if n!.right =! nil {
      c += traverse(n!.right, newMAx)
    }
    return c
  }
}

let cases = [
  ([3, 1, 4, 3, -1, 1, 5], 4),
  ([3, 3, -1, 4, 2], 3),
]

for c in cases {
  (treeNode(c.0)!.toString())
}
