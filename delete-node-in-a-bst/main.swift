class Solution {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    let preRoot = TreeNode(1_000_000)
    preRoot.left = root
    _ = swap(preRoot, key)
    return preRoot.left
  }

  func swap(_ node: TreeNode?, _ key: Int) -> TreeNode? {
    if let node = node {
      if node.val == key {
        if node.left == nil && node.right == nil {
          return node
        }

        if node.left != nil && node.right == nil {
          return node.left
        }
        let g = removeGreatestChild(node.right)
        g?.left = node.left
        return g
      } else if key < node.val {
        let swapped = swap(node.left, key)
        if let swapped = swapped {
        //   addMin(swapped, node.left)
          node.left = swapped
        }
        return nil
      } else {
        let swapped = swap(node.right, key)
        if let swapped = swapped {
        //   addMin(swapped, node.left)
          node.right = swapped
        }
        return nil
      }
    }
    return nil
  }

  func addMin(_ node: TreeNode, _ minNode: TreeNode?) {
    guard let minNode = minNode else {
      return
    }

    var n: TreeNode? = node
    while let unwarapped = n {
      n = unwarapped.left
    }
    n?.left = minNode
  }

  func removeGreatestChild(_ node: TreeNode?) -> TreeNode? {
    if let r = node?.right {
      let greatest = removeGreatestChild(r)
      if greatest === node?.right {
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
    ([0], 0, []),
]

for c in cases {
  let s = Solution().deleteNode(treeNode(c.0), c.1)
  print(s?.toString() ?? "None")
}
