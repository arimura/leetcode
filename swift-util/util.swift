public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public var childAppended = false
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

func treeNode(_ array: [Int]) -> TreeNode? {
  var a = array
  var n = TreeNode(a.removeFirst())
  while a.count != 0 {
    treeNodeAppend(&n, &a)
  }
  return n
}

func treeNodeAppend(_ n: inout TreeNode, _ array: inout [Int]) {
  if var l = n.left {
    treeNodeAppend(&l, &array)
  }
  if var r = n.right {
    treeNodeAppend(&r, &array)
  }

  if !n.childAppended {
    if array.isEmpty {
      return
    }
    let vl = array.removeFirst()
    if vl > 0 {
      n.left = TreeNode(vl)
    }
    if array.isEmpty {
      return
    }
    let vr = array.removeFirst()
    if vr > 0 {
      n.right = TreeNode(vr)
    }
    n.childAppended = true
  }
}