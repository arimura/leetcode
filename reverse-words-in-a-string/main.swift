func reverseWords(_ s: String) -> String {
    let array = Array(s)
    var reversed : [String] = []
    var word:[Character] = []
    for c in array {
        if(c == " "){
            if (word.count == 0){
                //new word
                continue
            }else{
                //splitter
                reversed.insert(String(word), at:0)
                word = []
            }
        }else{
            word.append(c)
        }
    }
    if (word.count != 0){
        reversed.insert(String(word), at:0)
        word = []
    }
    
    var s: String = ""
    for w in reversed {
        s.append(w)
        s.append(" ")
    }
    s.removeLast()
    return s
}

print(reverseWords("a good   example"))
