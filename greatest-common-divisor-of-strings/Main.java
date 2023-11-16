public class Main {
    public static void main(String[] args){
        System.out.println(gcdOfStrings("ABABAB", "ABAB"));
    }

    public static String gcdOfStrings(String str1, String str2) {
        if(!(str1 + str2).equals(str2 + str1)){
            return "";
        }
        int index = gco(str1.length(), str2.length());
        return str1.substring(0, index);
    }

    public static int gco(int i, int j){
        return j == 0 ? i : gco(j , i%j);
    }
}