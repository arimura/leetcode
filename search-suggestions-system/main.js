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
            return word.split("").map(e => []);
        }
        for (let i = 0; i < word.length; i++) {
            const sw = word.slice(0, i + 1);
            const f = n.find(sw);
            f.sort();
            r.push(f.slice(0,3));
        }
        return r;
    }

    find(word) {
        let r = [];
        if (word.length === 1) {
            for (const key in this.children) {
                r = r.concat(this.children[key].find(" "));
            }
            r = r.map(e => this.char + e);
        } else {
            const nc = word[1];
            if (this.children[nc]) {
                r = r.concat(this.children[nc].find(word.slice(1)));
                r = r.map(e => this.char + e);
            }
        }
        if (this.isEnd && word.length === 1) {
            r.push(this.char);
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

const r1 = suggestedProducts(["mobile", "mouse", "moneypot", "monitor", "mousepad","mou"], "mousea");
console.log("===");
console.log(r1);
