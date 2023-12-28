import XCTest

@testable import LeetcodeUtil

final class swift_utilTests: XCTestCase {
  func testHaveSameValuesWithBothTreesEmpty() {
    // Both trees are empty
    XCTAssert(haveSameValues(node1: nil, node2: nil), "Both trees are empty, should return true")
  }

  func testHaveSameValuesWithOneTreeEmpty() {
    // One tree is empty, another is not
    let root = TreeNode(1)
    XCTAssertFalse(
      haveSameValues(node1: root, node2: nil),
      "One tree is empty and another is not, should return false")
  }

  func testHaveSameValuesWithIdenticalTrees() {
    // Both trees are identical
    let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
    let root2 = TreeNode(1, TreeNode(2), TreeNode(3))
    XCTAssert(
      haveSameValues(node1: root1, node2: root2), "Both trees are identical, should return true")
  }

  func testHaveSameValuesWithDifferentTreesSameValues() {
    // Trees with the same values but different structure
    let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
    let root2 = TreeNode(3, TreeNode(1), TreeNode(2))
    XCTAssert(
      haveSameValues(node1: root1, node2: root2),
      "Trees have same values but different structure, should return true")
  }

  func testHaveSameValuesWithDifferentValues() {
    // Trees with different values
    let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
    let root2 = TreeNode(4, TreeNode(5), TreeNode(6))
    XCTAssertFalse(
      haveSameValues(node1: root1, node2: root2), "Trees have different values, should return false"
    )
  }

  func testHaveSameValuesWithNonBinarySearchTree() {
    // Trees with similar structure but different values
    let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
    let root2 = TreeNode(1, TreeNode(3), TreeNode(2))
    XCTAssertTrue(
      haveSameValues(node1: root1, node2: root2),
      "Trees have similar structure but different values, should return false")
  }
}
