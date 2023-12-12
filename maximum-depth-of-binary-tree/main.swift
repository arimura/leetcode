public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() {
    self.val = 0
    self.left = nil
    self.right = nil
  }
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }

  func toString() -> String {
    return buildTreeString(isTail: true)
  }

  private func buildTreeString(prefix: String = "", isTail: Bool) -> String {
    var result = ""

    if right != nil {
      let newPrefix = prefix + (isTail ? "│   " : "    ")
      result += right!.buildTreeString(prefix: newPrefix, isTail: false)
    }

    result += prefix + (isTail ? "└── " : "┌── ") + String(val) + "\n"

    if left != nil {
      let newPrefix = prefix + (isTail ? "    " : "│   ")
      result += left!.buildTreeString(prefix: newPrefix, isTail: true)
    }

    return result
  }
}

class Solution {
  func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    return find(root, 1)
  }

  func find(_ n: TreeNode?, _ count: Int) -> Int {
    var leftC = count
    if n?.left != nil {
      leftC = find(n?.left, leftC + 1)
    }
    var rightC = count
    if n?.right != nil {
      rightC = find(n?.right, rightC + 1)
    }

    return leftC < rightC ? rightC : leftC
  }
}

var n1 = TreeNode(1)
var n2 = TreeNode(2)
var n3 = TreeNode(3)
var n4 = TreeNode(4)
var n5 = TreeNode(5)
var n6 = TreeNode(6)
var n7 = TreeNode(7)
var n8 = TreeNode(8)
n1.left = n2
n1.right = n3
n2.left = n4
n2.right = n5
n3.left = n6
n3.right = n7
n7.right = n8
print(n1.toString())

let s = Solution()
print(s.maxDepth(n1))
// func treeNode(fromArray array: [Int]) -> TreeNode {
//   var head = TreeNode()
//   var n = head
//   for e in array {

//   }
// }

// func insert(_ i:Int, _ atNode: TreeNode){

// }
