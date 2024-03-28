import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public int[] successfulPairs(int[] spells, int[] potions, long success) {
        List<Integer> ret = new ArrayList<Integer>();
        Arrays.sort(potions);
        int len = potions.length;

        for (int spell : spells) {
            if(success <= (long)potions[0] * (long)spell){
                ret.add(len);
                continue;
            }
            if ((long)potions[len-1] * (long)spell < success){
                ret.add(0);
                continue;
            }
            ret.add(len - find(spell, success, potions, 0, len));
        }
        return ret.stream()
                .mapToInt(Integer::intValue)
                .toArray();
    }
    private int find(int spell, long success, int[] potions, int l, int r){
        if (l + 1 == r) {
            return r;
        }
        
        int m = (r - l) / 2 + l;
        if (success <= ((long)potions[m] * (long)spell)){
            return find(spell, success, potions, l, m);
        } else {
            return find(spell, success, potions, m , r);
        }
    }

    public static void main(String[] args) {
        TestCase[] cases = new TestCase[] {
                new TestCase(new int[] { 5, 1, 3 }, new int[] { 1, 2, 3, 4, 5 }, 7, new int[] { 4, 0, 3 }),
        };
        Main s = new Main();
        for (TestCase testCase : cases) {
            int[] r = s.successfulPairs(testCase.spells, testCase.getPotions(), testCase.getSuccess());
            System.out.println(Arrays.toString(r));
            if (!isSame(r, testCase.getExpected())) {
                throw new RuntimeException(testCase.toString());
            }
        }
    }

    static class TestCase {
        private final int[] spells;
        private final int[] potions;
        private final long success;
        private final int[] expected;

        public TestCase(int[] spells, int[] potions, long success, int[] expected) {
            this.spells = spells;
            this.potions = potions;
            this.success = success;
            this.expected = expected;
        }

        public int[] getExpected() {
            return expected;
        }

        public int[] getSpells() {
            return spells;
        }

        public int[] getPotions() {
            return potions;
        }

        public long getSuccess() {
            return success;
        }
    }

    public static boolean isSame(int[] array1, int[] array2) {
        if (array1.length != array2.length) {
            return false;
        }

        for (int i = 0; i < array1.length; i++) {
            if (array1[i] != array2[i]) {
                return false;
            }
        }

        return true;
    }
}
