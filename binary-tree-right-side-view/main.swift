class Solution {
  var vals: [Int] = []
  func rightSideView(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }
    traverse(root, 1)
    return vals
  }

  func traverse(_ n: TreeNode?, _ depth: Int) {
    if vals.count < depth {
      vals.append(n!.val)
    }

    if n!.right != nil {
      traverse(n!.right, depth + 1)
    }

    if n!.left != nil {
      traverse(n!.left, depth + 1)
    }
  }
}

let cases = [
  ([1, 2, 3, nil, 5, nil, 4], [1, 3, 4]),
  ([1, nil, 3], [1, 3]),
  ([], []),
  ([1, 2], [1, 2]),
]

for c in cases {
  let s = Solution()
  let r = s.rightSideView(treeNode(c.0))
  assert(c.1 == r, "c: \(c), r: \(r)")
}
