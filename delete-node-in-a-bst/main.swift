class Solution {
  func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    if root == nil {
      return nil
    }

    var node = root
    var prev = root
    while let currentNode = node, let currentPrev = prev {
        print(currentNode.val)
      if currentNode.val == key {
        swap(node: currentNode, prev: currentPrev)
        return root
      }
      if key < currentNode.val {
        node = currentNode.left
        prev = currentNode
      } else {
        node = currentNode.right
        prev = currentNode
      }
    }
    return root
  }

  func findGreatest(node: TreeNode?) -> TreeNode? {
    var n = node
    while let unwrappedN = n {
        n = unwrappedN.right
    }
    return n 
  } 


//   func swap(node: TreeNode, prev: TreeNode) {
//     var pad: TreeNode?
//     if node.left != nil {
//       pad = node.left
//     } else {
//       pad = node.right
//     }

//     if prev.left!.val == node.val {
//       prev.left = pad
//       pad.left = node.
//     } else {
//       prev.right = pad
//     }
//   }
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