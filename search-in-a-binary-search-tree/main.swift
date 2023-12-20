class Solution {
  func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    var n = root
    while let current = n {
      if current.val == val {
        return n 
      }
      if val <= current.val {
        n = current.left
      }else {
      n = current.right
      }
    }
    return nil
  }
}

let cases = [
  ([4, 2, 7, 1, 3], 2, [2, 1, 3]),
  ([4, 2, 7, 1, 3], 5, []),
]

for c in cases {
  let s = Solution()
  let r = s.searchBST(treeNode(c.0), c.1)
  print(r?.toString() ?? "none")
}
