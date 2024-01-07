enum Op {
  case multiple
  case divide
}

/// Expression
///
/// - Parameters:
///   - op: An instance of the `Op` type representing the operation to be performed.
///         This could be an enumeration defining operations like addition, subtraction, etc.
///   - v: A `String` representing a variable in the expression. Typically a symbolic name like "x" or "y".
///   - n: A `Double` representing a numerical value associated with the expression, such as a coefficient or constant.
///
struct Expr : Equatable{
  let op: Op
  let v: String
  let n: Double
}

typealias VarialbleEquations = [String: [Expr]]

class Solution {
  func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double]
  {
    var dic: VarialbleEquations = [:]
    for (i, equation) in equations.enumerated() {
      let first = equation[0]
      let second = equation[1]

      var firstExpressions = dic[first] ?? []
      firstExpressions.append(Expr(op: Op.multiple, v: second, n: values[i]))
      dic[first] = firstExpressions
      var secondExpressions = dic[second] ?? []
      secondExpressions.append(Expr(op: Op.divide, v: first, n: values[i]))
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
func expand(exp1: Expr, with exp2: Expr) -> Expr {
  if exp1.op == .multiple && exp2.op == .multiple {
    return Expr(
      op: .multiple, v: exp2.v, n: exp1.n * exp2.n)
  }
  if exp1.op == .multiple && exp2.op == .divide {
    return Expr(
      op: .multiple, v: exp2.v, n: exp1.n / exp2.n)
  }
  if exp1.op == .divide && exp2.op == .multiple {
    return Expr(
      op: .multiple, v: exp2.v, n: exp2.n / exp1.n)
  }
  if exp1.op == .divide && exp2.op == .divide {
    return Expr(op: .divide, v: exp2.v, n: exp1.n * exp1.n)
  }
  fatalError()
}

let ax2 = Expr(op: Op.multiple, v: "a", n: 2.0)
let bx3 = Expr(op: Op.multiple, v: "b", n: 3.0)
assert(
  expand(exp1: ax2, with: bx3) == Expr(op: .multiple, v: "b", n: 6.0),
  "expand test1")
let cDiv3 = Expr(op: .divide, v: "c", n: 3.0)
assert(
  expand(exp1: Expr(op: .multiple, v: "a", n: 6.0), with: cDiv3)
    == Expr(op: .multiple, v: "c", n: 2.0),
  "expand test2")
assert(
    expand(exp1: bx3, with: cDiv3) == Expr(op: .multiple, v: "c", n: 1),
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
