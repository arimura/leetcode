public class Main {
    public static void main(String[] args) {
        System.out.println(mergeAlternately("abcd", "pq"));
    }

    public static String mergeAlternately(String word1, String word2) {
        StringBuilder sb = new StringBuilder();

        int len1 = word1.length();
        int len2 = word2.length();
        int len = len1 < len2 ? len2 : len1;

        for (int j = 0; j < len; j++){
            if(j < len1)sb.append(word1.charAt(j));
            if(j < len2)sb.append(word2.charAt(j));
        }
        return sb.toString();
    }
}
