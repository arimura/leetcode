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

