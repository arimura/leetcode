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
  func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard var odd = head, var even = head?.next else {
      return head
    }
    let evenHead = even
    var current = even.next
    even.next = nil
    odd.next = nil
    var isOdd = true
    while let v = current {
      if isOdd {
        odd.next = v
        odd = v
        current = v.next
        v.next = nil
        isOdd = false
      } else {
        even.next = v
        even = v
        current = v.next
        v.next = nil
        isOdd = true
      }
    }
    odd.next = evenHead
    return head
  }
}

let cases = [
  ([1, 2, 3, 4, 5], [1, 3, 5, 2, 4]),
  ([2, 1, 3, 5, 6, 4, 7], [2, 3, 6, 7, 1, 5, 4]),
]

let s = Solution()
for c in cases {
  let r = s.oddEvenList(makeListNode(from: c.0))
  print(r ?? "None")
}
