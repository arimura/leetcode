/**
 * @param {number} k
 * @param {number} n
 * @return {number[][]}
 */
var combinationSum3 = function(k, n) {
   find([],0, k, 1,n);
   return r;
};

let r = [];

const find = function(combi, sum, k, idx, n) {
   console.log("idx is " + idx);
   if(combi.length == k) {
      console.log(combi);
      if(sum == n){
         r.push(combi);
      }
      return ;
   }

   combi.push(idx);

   for (i = idx + 1; i <=9; i++){
      const c = combi.slice();
      find(c, sum + idx, k, i, n);
   }   
}

console.log(combinationSum3(3,9));