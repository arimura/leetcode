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
}

func treeNode(fromArray array: [Int]) -> TreeNode {
  var head = TreeNode()
  var n = head
  var isLeft = true
  for e in array {
    if isLeft {
      if e != nil {
        n.left = TreeNode(e)
      }
    }else{
      if e != nil {
        n.right = TreeNode(e)
      }
      n = n.left
    }
  }
}
