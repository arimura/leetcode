class Solution {
    var rightVals : Array<Int> = []
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        traverseRight(root)
        return rightVals
    }

    func traverseRight(_ n: TreeNode?) {
        rightVals.append(n!.val)
        if n!.right != nil {
            traverseRight(n!.right)
        }
    }
}

let cases = [
([1,2,3,nil,5,nil,4], [1,3,4]),
([1,nil,3], [1,3]),
([], []),
]

for c in cases {
    let s = Solution()
    let r = s.rightSideView(treeNode(c.0))
    assert(c.1 == r, "c: \(c), r: \(r)")
}