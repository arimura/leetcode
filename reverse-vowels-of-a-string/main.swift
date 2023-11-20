func reverseVowels(_ orgS: String) -> String {
    var s = orgS
    let len = s.count
    var startIdx = 0
    var endIdx = len - 1
    var isEnd = false
    while true {
        while true {
            if (startIdx == endIdx){
                isEnd = true
                break
            }
            
            if (isVowels(s, startIdx)){
                break
            }
            startIdx += 1
        }
        
        while true {
            if (startIdx == endIdx){
                isEnd = true
                break
            }
            if(isVowels(s, endIdx)){
                break
            }
            endIdx -= 1
        }
        
        if(!isEnd){
            
            let indexF = s.index(s.startIndex, offsetBy: startIdx)
            let indexB = s.index(s.startIndex, offsetBy: endIdx)
            let charF = s[indexF]
            let charB = s[indexB]
            
            s.replaceSubrange(indexF...indexF, with: String(charB))
            s.replaceSubrange(indexB...indexB, with: String(charF))
        }else {
            break
        }
        startIdx += 1
        endIdx += -1
        if(endIdx <= startIdx ){
            break
        }
        
    }
    
    return s
}

func isVowels(_ s: String, _ index: Int) -> Bool {
    let i = s.index(s.startIndex, offsetBy: index)
    let c = String(s[i])
    switch c {
    case "a", "A", "e", "E", "i", "I", "o", "O", "u", "U":
        return true
    default:
        return false
    }
}

print(reverseVowels("leetcode"));
