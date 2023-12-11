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

var n1 = TreeNode(1)
var n2 = TreeNode(2)
var n3 = TreeNode(3)
n1.left = n2
n1.right = n3
print(n1.toString())

// func treeNode(fromArray array: [Int]) -> TreeNode {
//   var head = TreeNode()
//   var n = head
//   var isLeft = true
//   for e in array {
//     if isLeft {
//       if e != nil {
//         n.left = TreeNode(e)
//       }
//     }else{
//       if e != nil {
//         n.right = TreeNode(e)
//       }
//       n = n.left
//     }
//   }
// }
