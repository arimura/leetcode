class Solution {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    if root?.val == key && root?.left == nil && root?.right == nil {
      return nil
    }

    let preRoot = TreeNode(1_000_000)
    preRoot.left = root
    _ = swap(preRoot, key)
    return preRoot.left
  }

  func swap(_ node: TreeNode?, _ key: Int) -> (Bool, TreeNode?) {
    if let node = node {
      if node.val == key {
        if node.left == nil && node.right == nil {
          return (true, nil)
        }

        if node.left != nil && node.right == nil {
          return (true, node.left)
        }
        let g = removeGreatestChild(node.left)
        if node.left?.val != g?.val {
          let l = node.left
          node.left = nil
          g?.left = l
        }
        let r = node.right
        node.right = nil
        g?.right = r
        return (true, g)
      } else if key < node.val {
        let (r, swapped) = swap(node.left, key)
        if r {
          node.left = swapped
        }
        return (false, nil)
      } else {
        let (r, swapped) = swap(node.right, key)
        if r {
          node.right = swapped
        }
        return (false, nil)
      }
    }
    return (false, nil)
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
  // ([5, 3, 6, 2, 4, nil, 7], 3, [5, 4, 6, 2, nil, nil, 7]),
  // ([5, 3, 6, 2, 4, nil, 7], 0, [5, 3, 6, 2, 4, nil, 7]),
  // ([], 0, []),
  // ([0], 0, []),
  // ([5,3,6,2,4,nil,7],5,[6,3,7,2,4]),
  //   ([5, 3, 6, 2, 4, nil, 7], 3, [])
//   ([5, 3, 6, 2, 4, nil, 7], 7, [5, 3, 6, 2, 4])
  ([1,nil,2], 1, [22])
]

for c in cases {
  let orgTree = treeNode(c.0)
  print(orgTree?.toString() ?? "None")
  let s = Solution().deleteNode(orgTree, c.1)
  print(s?.toString() ?? "None")
}
