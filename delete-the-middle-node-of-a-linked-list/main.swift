import Foundation

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
  func deleteMiddle(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
      return nil
    }
    var cnt = 0
    var next = head
    while let n = next {
      cnt += 1
      next = n.next
    }
    var half = Int(floor(Double(cnt) / 2.0)) - 1
    var delPrevNode: ListNode? = head
    while half > 0 {
      delPrevNode = delPrevNode?.next
      half -= 1
    }
    delPrevNode?.next = delPrevNode?.next?.next
    return head
  }
}

let cases = [
  ([1, 3, 4, 7, 1, 2, 6], [1, 3, 4, 1, 2, 6]),
  ([1, 2, 3, 4], [1, 2, 4]),
  ([2, 1], [2]),
  ([1], [1]),
]

let s = Solution()
for c in cases {
  //   print(makeListNode(from: c.0) ?? "None")
  print(s.deleteMiddle(makeListNode(from: c.0)) ?? "None")
}
