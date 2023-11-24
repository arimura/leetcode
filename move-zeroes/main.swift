func moveZeroes(_ nums: inout [Int]) {
  var firstZeroIdx = -1
  let l = nums.count

  for i in 0..<l {
    if nums[i] == 0 {
      if firstZeroIdx == -1 {
        firstZeroIdx = i
        continue
      }
      continue
    }

    if firstZeroIdx == -1 {
      continue
    }

    nums[firstZeroIdx] = nums[i]
    nums[i] = 0
    firstZeroIdx += 1
  }
}

var a = [0, 1, 0, 3, 12]
moveZeroes(&a)
print(a)

var b = [0]
moveZeroes(&b)
print(b)

var c = [1, 0, 1]
moveZeroes(&c)
print(c)
