enum Op {
  case multiple
  case divide
}
typealias Expression = (op: Op, argVariable: String, argNum: Double)
typealias VarialbleEquations = [String: [Expression]]

class Solution {
  func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double]
  {
    var dic: VarialbleEquations = [:]
    for (i, equation) in equations.enumerated() {
      let first = equation[0]
      let second = equation[1]

      var firstExpressions = dic[first] ?? []
      firstExpressions.append((op: Op.multiple, argVariable: second, argNum: values[i]))
      dic[first] = firstExpressions
      var secondExpressions = dic[second] ?? []
      secondExpressions.append((op: Op.divide, argVariable: first, argNum: values[i]))
      dic[second] = secondExpressions
    }
    print(dic)
    // for query in queries {
    //   let first = query[0]
    //   let second = query[1]

    //   //convert first variable
    // }

    return []
  }
}

/// Expand exp1 variable with exp2
/// - Parameters:
///   - exp1:
///   - exp2:
/// - Returns:
func expand(exp1: Expression, with exp2: Expression) -> Expression {
  if exp1.op == .multiple && exp2.op == .multiple {
    return Expression(
      op: .multiple, argVariable: exp2.argVariable, argNum: exp1.argNum * exp2.argNum)
  }
  if exp1.op == .multiple && exp2.op == .divide {
    return Expression(
      op: .multiple, argVariable: exp2.argVariable, argNum: exp1.argNum / exp2.argNum)
  }
  if exp1.op == .divide && exp2.op == .multiple {
    return Expression(
      op: .multiple, argVariable: exp2.argVariable, argNum: exp2.argNum / exp1.argNum)
  }
  if exp1.op == .divide && exp2.op == .divide {
    return Expression(op: .divide, argVariable: exp2.argVariable, argNum: exp1.argNum * exp1.argNum)
  }
  fatalError()
}

let ax2 = Expression(op: Op.multiple, argVariable: "a", argNum: 2.0)
let bx3 = Expression(op: Op.multiple, argVariable: "b", argNum: 3.0)
assert(
  expand(exp1: ax2, with: bx3) == Expression(op: .multiple, argVariable: "b", argNum: 6.0),
  "expand test1")
let cDiv3 = Expression(op: .divide, argVariable: "c", argNum: 3.0)
assert(
  expand(exp1: Expression(op: .multiple, argVariable: "a", argNum: 6.0), with: cDiv3)
    == Expression(op: .multiple, argVariable: "c", argNum: 2.0),
  "expand test2")
assert(
  expand(exp1: bx3, with: cDiv3) == Expression(op: .multiple, argVariable: "c", argNum: 0),
  "expand test3")

let cases = [
  (
    [["a", "b"], ["b", "c"]], [2.0, 3.0],
    [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]],
    [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]
  ),
  (
    [["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0],
    [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]], [3.75000, 0.40000, 5.00000, 0.20000]
  ),
  (
    [["a", "b"]], [0.5], [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]],
    [0.50000, 2.00000, -1.00000, -1.00000]
  ),
]
let s = Solution()
for c in cases {
  let r = s.calcEquation(c.0, c.1, c.2)
  assert(r == c.3, "c: \(c), r: \(r)")
}
