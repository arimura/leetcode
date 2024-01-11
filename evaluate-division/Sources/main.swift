enum Op {
  case multiple
  case divide
}

struct Equation: Equatable {
  let op: Op
  let v: String
  let n: Double
}

typealias VarialbleEquations = [String: [Equation]]

class Solution {
  var answers: [Double] = []
  var visited: Set<String> = []
  func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double]
  {
    var dic: VarialbleEquations = [:]
    for (i, equation) in equations.enumerated() {
      let first = equation[0]
      let second = equation[1]

      var firstExpressions = dic[first] ?? []
      firstExpressions.append(Equation(op: Op.multiple, v: second, n: values[i]))
      dic[first] = firstExpressions
      var secondExpressions = dic[second] ?? []
      secondExpressions.append(Equation(op: Op.divide, v: first, n: values[i]))
      dic[second] = secondExpressions
    }
    for query in queries {
      let first = query[0]
      let second = query[1]
      visited = []

      if first == second && dic.keys.contains(first) {
        answers.append(1.0)
        continue
      }

      var dicForQ = dic
      print(dicForQ)
      visited.insert(second)
      let currentEq = Equation(op: .multiple, v: second, n: 1)
      if !walk(&dicForQ, currentEq, first){
        answers.append(-1)
      }
    }

    return answers
  }

  func walk(_ dic: inout VarialbleEquations, _ prevEq: Equation, _ goalVar: String) -> Bool {
    guard var eqs = dic.removeValue(forKey: prevEq.v) else {
      answers.append(-1)
      return true
    }

    while eqs.count > 0 {
      let eq = eqs.removeFirst()
      if eqs.count > 0 {
        dic[prevEq.v] = eqs
      }
      if visited.contains(eq.v) {
        continue
      }
      visited.insert(eq.v)

      let currentEq = substitute(exp1: prevEq, with: eq)
      print(currentEq)
      if goalVar == currentEq.v {
        answers.append(1 / currentEq.n)
        return true
      } else {
        if walk(&dic, currentEq, goalVar) {
          return true
        }
      }
    }

    return false
  }
}

/// Substitue var of exp2 with exp2
/// - Parameters:
///   - exp1:
///   - exp2:
/// - Returns:
func substitute(exp1: Equation, with exp2: Equation) -> Equation {
  if exp1.op == .multiple && exp2.op == .multiple {
    return
      Equation(
        op: .multiple, v: exp2.v, n: exp1.n * exp2.n)
  }
  if exp1.op == .multiple && exp2.op == .divide {
    return
      Equation(
        op: .multiple, v: exp2.v, n: exp1.n / exp2.n)
  }
  if exp1.op == .divide && exp2.op == .multiple {
    return
      Equation(
        op: .multiple, v: exp2.v, n: exp2.n / exp1.n)
  }
  if exp1.op == .divide && exp2.op == .divide {
    return Equation(op: .divide, v: exp2.v, n: exp1.n * exp1.n)
  }
  fatalError()
}

let cases = [
  // (
  //   [["a", "b"], ["b", "c"]], [2.0, 3.0],
  //   [["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"]],
  //   [6.00000, 0.50000, -1.00000, 1.00000, -1.00000]
  // ),
  // (
  //   [["a", "b"], ["b", "c"], ["bc", "cd"]], [1.5, 2.5, 5.0],
  //   [["a", "c"], ["c", "b"], ["bc", "cd"], ["cd", "bc"]], [3.75000, 0.40000, 5.00000, 0.20000]
  // ),
  // (
  //   [["a", "b"]], [0.5], [["a", "b"], ["b", "a"], ["a", "c"], ["x", "y"]],
  //   [0.50000, 2.00000, -1.00000, -1.00000]
  // ),
  // (
  //   [["x1", "x2"], ["x2", "x3"], ["x3", "x4"], ["x4", "x5"]], [3.0, 4.0, 5.0, 6.0],
  //   [["x5", "x2"]], [0.00833]
  // )
  ([["a","b"],["c","d"]],[1.0,1.0],[["a","c"],["b","d"],["b","a"],["d","c"]],[-1.00000,-1.00000,1.00000,1.00000]),
]
let s = Solution()
for c in cases {
  let r = s.calcEquation(c.0, c.1, c.2)
  assert(r == c.3, "c: \(c), r: \(r)")
}
