import XCTest

@testable import evaluate_division

final class EvaluateDivisionTests: XCTestCase {
  func testExpand() {
    let testCases = [
      // Case 1: Both equations have .multiple operation
      (
        exp1: Equation(op: .multiple, v: "x", n: 2), exp2: Equation(op: .multiple, v: "y", n: 3),
        expected: Equation(op: .multiple, v: "y", n: 6)
      ),

      // Case 2: exp1 has .multiple and exp2 has .divide
      (
        exp1: Equation(op: .multiple, v: "x", n: 4), exp2: Equation(op: .divide, v: "y", n: 2),
        expected: Equation(op: .multiple, v: "y", n: 2)
      ),

      // Case 3: exp1 has .divide and exp2 has .multiple
      (
        exp1: Equation(op: .divide, v: "x", n: 5), exp2: Equation(op: .multiple, v: "y", n: 2),
        expected: Equation(op: .multiple, v: "y", n: 0.4)
      ),

      // Case 4: Both equations have .divide operation
      (
        exp1: Equation(op: .divide, v: "x", n: 3), exp2: Equation(op: .divide, v: "y", n: 4),
        expected: Equation(op: .divide, v: "y", n: 9)
      ),
      // Add more test cases here if needed

    ]

    // Iterate over each test case
    for (exp1, exp2, expected) in testCases {
      let result = expand(exp1: exp1, with: exp2)
      XCTAssertEqual(result, expected, "Failed for exp1: \(exp1), exp2: \(exp2)")
    }
  }
}
