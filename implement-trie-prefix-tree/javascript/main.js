
var Trie = function() {
    this.children = {};
    this.words = {};
};

/** 
 * @param {string} word
 * @return {void}
 */
Trie.prototype.insert = function(word) {
    this.words[word] = true;
    this.insertRec(word);
};

Trie.prototype.insertRec = function(word) {
    var c = word.charAt(0);
    var v = this.children[c];
    if(!v){
        v = new Trie();
        this.children[c] = v;
    }
    if(word.length > 1) {
        v.insertRec(word.slice(1));
    } 
}

/** 
 * @param {string} word
 * @return {boolean}
 */
Trie.prototype.search = function(word) {
    if(this.words[word]){
        return true;
    }
    return false;
};

/** 
 * @param {string} prefix
 * @return {boolean}
 */
Trie.prototype.startsWith = function(prefix) {
    var c = prefix.charAt(0);
    var v = this.children[c];
    if(!v) {
        return false;
    }else {
        if (prefix.length > 1){
            return v.startsWith(prefix.slice(1));
        }
        return true;
    } 
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
