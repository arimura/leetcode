
var Trie = function() {
    this.children = {};
};

/** 
 * @param {string} word
 * @return {void}
 */
Trie.prototype.insert = function(word) {
    var c = word.charAt(0);
    var v = this.children[c];
    if(!v){
        v = new Trie();
        this.children[c] = v;
    }
    if(word.length > 1) {
        v.insert(word.slice(1));
    } 
};

/** 
 * @param {string} word
 * @return {boolean}
 */
Trie.prototype.search = function(word) {
    var c = word.charAt(0);
    var v = this.children[c];
    if(!v) {
        return false;
    }else {
        if (word.length > 1){
            return v.search(word.slice(1));
        }
        return true;
    } 
};

/** 
 * @param {string} prefix
 * @return {boolean}
 */
Trie.prototype.startsWith = function(prefix) {
  return this.search(prefix); 
};

/** 
 * Your Trie object will be instantiated and called as such:
 * var obj = new Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */

var t = new Trie();
t.insert("hoge");
console.log(t.search("hoge"));
// console.log(t.search("hoge1"));
