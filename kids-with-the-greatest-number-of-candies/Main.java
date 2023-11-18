import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println(kidsWithCandies(new int[] { 2, 3, 5, 1, 3 }, 3));
    }

    public static List<Boolean> kidsWithCandies(int[] candies, int extraCandies) {
        List<Boolean> list = new ArrayList<>();

        int len = candies.length;
        for (int i = 0; i < len; i++) {
            boolean isGreatest = true;
            int added = candies[i] + extraCandies;
            for (int j = 0; j < len; j++) {
                if (added < candies[j]) {
                    list.add(Boolean.FALSE);
                    isGreatest = false;
                    break;
                }
            }
            if (isGreatest) {
                list.add(Boolean.TRUE);
            }
        }

        return list;
    }
}