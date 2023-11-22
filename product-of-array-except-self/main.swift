func productExceptSelf(_ nums: [Int]) -> [Int] {
  let len = nums.count
  var prefix = Array(repeating: 0, count: len)
  var suffix = Array(repeating: 0, count: len)
  var p = Array(repeating: 0, count: len)
  for idx in 0..<len {
    if idx == 0 {
      prefix[0] = nums[0]
      continue
    }
    prefix[idx] = prefix[idx - 1] * nums[idx]
  }

  for idx in (0..<len).reversed() {
    if idx == len - 1 {
      suffix[idx] = nums[idx]
      continue
    }
    suffix[idx] = nums[idx] * suffix[idx + 1]
  }

  for idx in 0..<len {
    if idx == 0 {
      p[idx] = suffix[idx + 1]
      continue
    }
    if idx == len - 1 {
      p[idx] = prefix[idx - 1]
      continue
    }
    p[idx] = prefix[idx - 1] * suffix[idx + 1]
  }
  return p
}

print(productExceptSelf([-1, 1, 0, -3, 3]))

// [a, b, c, d, e]
// [a, a*b, a*b*c, a*b*c*d, a*b*c*d*e]
// [a*b*c*d*e ,b*c*d*e ,c*d*e ,d*e,e]
