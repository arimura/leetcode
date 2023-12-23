class Solution {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else {
        return nil
    }

    if root.right == nil && root.left == nil {
      if root.val == key {
        return nil
      }
      return root
    }

    var node :TreeNode? = root
    var prev :TreeNode? = root
    var fromPrevRight = true
    while let currentNode = node, let currentPrev = prev {
    //   print(currentNode.val)
      if currentNode.val == key {
        swap(node: currentNode, prev: currentPrev, isPrevRight: fromPrevRight)
        return root
      }
      if key < currentNode.val {
        node = currentNode.left
        prev = currentNode
        fromPrevRight = false
      } else {
        node = currentNode.right
        prev = currentNode
        fromPrevRight = true
      }
    }
    return root
  }

  func removeGreatestChild(node: TreeNode?) -> TreeNode? {
    if node?.right == nil {
        return nil
    }
    var n = node
    while let grandChild = n?.rigtht?.right {
        n = 
    }
  }

  func swap(node: TreeNode, prev: TreeNode, isPrevRight: Bool) {
    if node == prev {
       let greatest = retriveGreatest(node: node.left) 
       greatest?.right = node.right
       return
    }

    if node.left == nil {
      if node.right == nil {
        return
      }
      if isPrevRight {
        prev.right = node.right
      } else {
        prev.left = node.right
      }
      return
    }

    let greatest = retriveGreatest(node: node.left)
    greatest?.right = node.right
    if isPrevRight {
      prev.right = greatest
    } else {
      prev.left = greatest
    }
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
