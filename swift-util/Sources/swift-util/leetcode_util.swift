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

func treeNode(_ array: [Int?]) -> TreeNode? {
  if array.isEmpty {
    return nil
  }
  var a = array
  var n = TreeNode(a.removeFirst()!)
  while a.count != 0 {
    treeNodeAppend(&n, &a)
  }
  return n
}

func treeNodeAppend(_ n: inout TreeNode, _ array: inout [Int?]) {
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
    if let vl = vl {
      n.left = TreeNode(vl)
    }
    if array.isEmpty {
      return
    }
    let vr = array.removeFirst()
    if let vr = vr {
      n.right = TreeNode(vr)
    }
    n.childAppended = true
  }
}

func storeValues(from node: TreeNode?, into list: inout [Int]) {
  guard let node = node else {
    return
  }
  storeValues(from: node.left, into: &list)
  list.append(node.val)
  storeValues(from: node.right, into: &list)
}

func haveSameValues(node1: TreeNode?, node2: TreeNode?) -> Bool {
  var v1 = Array<Int>()
  var v2 = Array<Int>()
  storeValues(from: node1, into: &v1)
  storeValues(from: node2, into: &v2)
  return v1.sorted() == v2.sorted()
}
