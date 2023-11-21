func productExceptSelf(_ nums: [Int]) -> [Int] {
  var listPrd: [Int] = []
  for i in nums.indices {
    var p = 1
    for (idxPrd, e) in nums.enumerated() {
      if i == idxPrd {
        continue
      }
      p *= e
    }
    listPrd.append(p)
  }
  return listPrd
}

print(productExceptSelf([-1, 1, 0, -3, 3]))
