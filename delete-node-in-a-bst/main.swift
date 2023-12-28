import LeetcodeUtil

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

        if node.left == nil && node.right != nil {
          let s = removeSmallestChild(node.right)
          if node.right !== s {
            let r = node.right
            node.right = nil
            s?.right = r
          }
          s?.left = node.left
          return (true, s)
        }
        let g = removeGreatestChild(node.left)
        if node.left !== g {
          let l = node.left
          node.left = nil
          g?.left = l
        }
        g?.right = node.right
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

  func removeSmallestChild(_ node: TreeNode?) -> TreeNode? {
    if let l = node?.left {
      let smallest = removeSmallestChild(l)
      if smallest === node?.left {
        node?.left = nil
      }
      return smallest
    }
    return node
  }
}

let cases = [
  //   ([5, 3, 6, 2, 4, nil, 7], 3, [5, 4, 6, 2, nil, nil, 7]),
  // ([5, 3, 6, 2, 4, nil, 7], 0, [5, 3, 6, 2, 4, nil, 7]),
  // ([], 0, []),
  // ([0], 0, []),
  // ([5,3,6,2,4,nil,7],5,[6,3,7,2,4]),
  //   ([5, 3, 6, 2, 4, nil, 7], 3, [])
  //   ([5, 3, 6, 2, 4, nil, 7], 7, [5, 3, 6, 2, 4])
  //   ([1, nil, 2], 1, [2])
  (
    [
      8, 0, 31, nil, 6, 28, 45, 1, 7, 25, 30, 32, 49, nil, 4, nil, nil, 9, 26, 29, nil, nil, 42, 47,
      nil, 2, 5, nil, 12, nil, 27, nil, nil, 41, 43, 46, 48, nil, 3, nil, nil, 10, 19, nil, nil, 33,
      nil, nil, 44, nil, nil, nil, nil, nil, nil, nil, 11, 18, 20, nil, 37, nil, nil, nil, nil, 14,
      nil, nil, 22, 36, 38, 13, 15, 21, 24, 34, nil, nil, 39, nil, nil, nil, 16, nil, nil, 23, nil,
      nil, 35, nil, 40, nil, 17,
    ], 1,
    [
      8, 0, 31, nil, 6, 28, 45, 2, 7, 25, 30, 32, 49, nil, 4, nil, nil, 9, 26, 29, nil, nil, 42, 47,
      nil, 3, 5, nil, 12, nil, 27, nil, nil, 41, 43, 46, 48, nil, nil, nil, nil, 10, 19, nil, nil,
      33, nil, nil, 44, nil, nil, nil, nil, nil, 11, 18, 20, nil, 37, nil, nil, nil, nil, 14, nil,
      nil, 22, 36, 38, 13, 15, 21, 24, 34, nil, nil, 39, nil, nil, nil, 16, nil, nil, 23, nil, nil,
      35, nil, 40, nil, 17,
    ]
  )
]

for c in cases {
  let orgTree = treeNode(c.0)
  print(orgTree?.toString() ?? "None")
  let s = Solution().deleteNode(orgTree, c.1)
  print(s?.toString() ?? "None")
}
