class Solution {
  var max = 0
  func longestZigZag(_ root: TreeNode?) -> Int {
    if root!.left != nil {
      traverse(root!.left, false, 1)
    }
    if root!.right != nil {
      traverse(root!.right, true, 1)
    }
    return max
  }

  func traverse(_ n: TreeNode?, _ leftNext: Bool, _ cnt: Int) {
    if leftNext {
      if n!.left != nil {
        traverse(n!.left, false, cnt + 1)
      } else {
        if max < cnt {
          max = cnt
        }
      }
      if n!.right != nil {
        traverse(n!.right, true, 1)
      }
    } else {

      if n!.right != nil {
        traverse(n!.right, true, cnt + 1)
      } else {
        if max < cnt {
          max = cnt
        }
      }
      if n!.left != nil {
        traverse(n!.left, false, 1)
      }
    }
  }
}

let cases = [
  ([1, nil, 1, 1, 1, nil, nil, 1, 1, nil, 1, nil, nil, nil, 1], 3),
  ([1, 1, 1, nil, 1, nil, nil, 1, 1, nil, 1], 4),
]
let s = Solution()
for c in cases {
  let r = s.longestZigZag(treeNode(c.0))
  assert(r == c.1, "c: \(c), r: \(r)")
}
