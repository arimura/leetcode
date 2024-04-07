/**
 * @param {number} k
 * @param {number} n
 * @return {number[][]}
 */
var combinationSum3 = function (k, n) {
   var r = [];
   find([], 0, k, 1, n, r);
   return r;
};

var find = function (combi, sum, k, idx, n, r) {
   for (var i = idx; i <= 9; i++) {
      const c = [...combi];
      c.push(i);
      var updated = sum + i;

      if (c.length == k) {
         if (updated == n) {
            r.push(c);
         }
         continue;
      }

      if (i != 9) {
         find(c, updated, k, i + 1, n, r);
      }
   }
}

console.log(combinationSum3(3, 9));