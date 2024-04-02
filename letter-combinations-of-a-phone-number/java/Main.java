import java.util.ArrayList;
import java.util.List;

public class Main {
    String[][] m = new String[][]{
        new String[]{"a","b","c"},
        new String[]{"d","e","f"},
        new String[]{"g","h","i"},
        new String[]{"j","k","l"},
        new String[]{"m","n","o"},
        new String[]{"p","q","r","s"},
        new String[]{"t","u","v"},
        new String[]{"w","x","y","z"}
    }; 

    public List<String> letterCombinations(String digits) {
        if (digits.length() == 0) {
            return new ArrayList<>();
        }
        char c = digits.charAt(0);

        String sub = digits.substring(1, digits.length());
        List<String> preList = letterCombinations(sub);
        List<String> n = new ArrayList<>();
        if(preList.size() == 0) {
            preList = new ArrayList<>();
            preList.add("");
        }
        for (String preString : preList) {
            String[] chars = m[Character.getNumericValue(c)-2];
            for (String chr : chars) {
                n.add(chr + preString);
            }
        }

        return n;
    }    
}
