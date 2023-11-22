func increasingTriplet(_ nums: [Int]) -> Bool {
  var a = [Int]()
  var b: Int? = nil
  var l = nums.count
  for idx in 0..<l {
    if idx == 0 {
      a.append(nums[idx])
      continue
    }
    if a.count == 1 {
      if a[0] < nums[idx] {
        a.append(nums[idx])
        continue
      } else {
        a[0] = nums[idx]
        continue
      }
    }
    if a.count == 2 {
      if let last = a.last, last < nums[idx] {
        return true
      }

      if let c = b, c < nums[idx] {
        a[0] = c
        a[1] = nums[idx]
        b = nil
        continue
      }

      if a[0] < nums[idx] && a[1] > nums[idx] {
        a[1] = nums[idx]
        continue
      }

      if a[0] > nums[idx] {
        b = nums[idx]
        continue
      }
    }
  }
  return false
}

print(increasingTriplet([20, 100, 10, 12, 5, 13]))

// [4, 6, 0, 2, 1, 3]

/*
idx=0
[5]

idx=1
[0] //5が大きいので

idx=2
[0,1]


*/
