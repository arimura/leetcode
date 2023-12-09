import Foundation

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

class Solution {
  func pairSum(_ head: ListNode?) -> Int {
    guard let head = head else {
      return 0
    }
    let fv = head.val
    var m = 0
    var current = head.next
    while current != nil {
      if current?.next == nil {
        break
      }
      print(current!.val + current!.next!.val)
      m = max(m, current!.val + current!.next!.val)
      current = current?.next?.next
    }
    m = max(m, fv + current!.val)
    return m
  }
}

let cases = [
//   ([5, 4, 2, 1], 6),
//   ([4, 2, 2, 3], 7),
//   ([1, 100000], 100001),
  ([47,22,81,46,94,95,90,22,55,91,6,83,49,65,10,32,41,26,83,99,14,85,42,99,89,69,30,92,32,74,9,81,5,9],182),
]

let s = Solution()
for c in cases {
  let r = s.pairSum(makeListNode(from: c.0))
  assert(r == c.1, "c: \(c), r:\(r)")
}
