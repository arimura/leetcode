class Solution {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    if root.val == key {
        
    }
  }

  func removeGreatestChild(_ node: TreeNode?) -> TreeNode {
    if let r = node?.right {
        let greatest = removeGreatestChild(r)
        if greatest == node?.right {
            node?.right = nil
        }
        return greatest
    }
    return node
  }
}

let cases = [
  ([5, 3, 6, 2, 4, nil, 7], 3, [5, 4, 6, 2, nil, nil, 7]),
  ([5, 3, 6, 2, 4, nil, 7], 0, [5, 3, 6, 2, 4, nil, 7]),
  ([], 0, []),
]

for c in cases {
  let s = Solution().deleteNode(treeNode(c.0), c.1)
  print(s?.toString() ?? "Node")
}
