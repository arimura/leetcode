const assert = require('assert');

class Node {
    constructor() {
        this.char = "";
        this.children = {};
        this.isEnd = false;
    }

    loadWords(words) {
        for (const word of words) {
            const c = word[0];
            if(!this.children[c]){
                this.children[c] = new Node();
            }
            this.children[c].load(word);
        }
    }

    load(word) {
        this.char = word[0];
        if (word.length === 1) {
            this.isEnd = true;
            return;
        }
        let nc = word[1];
        if (!this.children[nc]) {
            let c = new Node();
            this.children[nc] = c;
        }
        this.children[nc].load(word.slice(1));
    }
}

/**
 * @param {string[]} products
 * @param {string} searchWord
 * @return {string[][]}
 */
var suggestedProducts = function (products, searchWord) {


    return [];
};

let n = new Node();
n.loadWords(["mobile", "mouse", "moneypot", "monitor", "mousepad"]);


// assert.strictEqual(suggestedProducts(["mobile", "mouse", "moneypot", "monitor", "mousepad"], "mouse"), []);


