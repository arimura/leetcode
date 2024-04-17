const assert = require('assert');

// TODO: lexicographically order
class Node {
    constructor() {
        this.char = "";
        this.children = {};
        this.isEnd = false;
    }

    loadWords(words) {
        for (const word of words) {
            const c = word[0];
            if (!this.children[c]) {
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

    findSuggested(word) {
        const r = [];
        const n = this.children[word[0]];
        if (!n) {
            return [];
        }
        for (let i = 0; i < word.length; i++) {
            console.log(word.slice(0, i + 1));
            r.push(n.find(word.slice(0, i + 1)));
        }
        return r;
    }

    find(word) {
        console.log("in: " + this.char);
        const r = [];
        if (this.isEnd) {
            r.push(this.char);
        }
        if (word.length === 1) {
            for (const key in this.children) {
                r.concat(this.children[key].find(" "));
            }
            return r;
        }
        const nc = word[1];
        if (this.children[nc]) {
            r.concat(this.children[nc].find(word.slice(1)));
        }
        return r;
    }
}

/**
 * @param {string[]} products
 * @param {string} searchWord
 * @return {string[][]}
 */
var suggestedProducts = function (products, searchWord) {
    const n = new Node();
    n.loadWords(products);
    return n.findSuggested(searchWord);
};

console.log(suggestedProducts(["mobile", "mouse", "moneypot", "monitor", "mousepad"], "mouse"));
