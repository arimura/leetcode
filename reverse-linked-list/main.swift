public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() {
    self.val = 0
    self.next = nil
  }
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
  public init(_ val: Int, _ next: ListNode?) {
    self.val = val
    self.next = next
  }
}

extension ListNode: CustomStringConvertible {
  public var description: String {
    return "val: \(val), next: \(String(describing: next))"
  }
}

func makeListNode(from array: [Int]) -> ListNode? {
  var prev: ListNode?
  var head: ListNode?
  for i in array {
    if head == nil {
      prev = ListNode(i)
      head = prev
    } else {
      prev?.next = ListNode(i)
      prev = prev?.next
    }
  }
  return head
}

class Solution {
  func reverseList(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
      return head
    }
    var l: [ListNode] = []
    var node = head
    while let n = node {
      l.insert(n, at: 0)
      node = n.next
      n.next = nil
    }
    var r: ListNode = l.removeFirst()
    let newHead = r
    while l.count > 0 {
      let n = l.removeFirst()
      r.next = n
      print("r is \(r), n is \(n)")
      r = n
    }
    return newHead
  }
}

let cases = [
  ([1, 2, 3, 4, 5], [5, 4, 3, 2, 1]),
  ([1, 2], [2, 1]),
]
let s = Solution()
for c in cases {
  let r = s.reverseList(makeListNode(from: c.0))
  print(r ?? "None")
}
