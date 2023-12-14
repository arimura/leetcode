class Solution {
  func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    return leafArray(root1) == leafArray(root2)
  }

  func leafArray(_ t: TreeNode?) -> [Int] {
    var array: [Int] = []
    leafArrayTrv(t, &array)
    return array
  }

  func leafArrayTrv(_ t: TreeNode?, _ a: inout [Int]) {
    if t!.left != nil {
      leafArrayTrv(t!.left, &a)
    }
    if t!.right != nil {
      leafArrayTrv(t!.right, &a)
    }
    if t!.right == nil && t!.left == nil {
      a.append(t!.val)
    }
  }
}

//case1
typealias N = TreeNode

let root1 =
  N(
    3,
    N(
      5,
      N(6),
      N(
        2,
        N(7),
        N(4))
    ),
    N(1, N(9), N(8))
  )
let root2 =
  N(3, N(5, N(6), N(7)), N(1, N(4), N(2, N(9), N(8))))

let s = Solution()
s.leafSimilar(root1, root2)
