class Main {
    public int minEatingSpeed(int[] piles, int h) {
        int r = Integer.MAX_VALUE;
        int l = 1;
        int m = 0;
        while (l + 1 != r){
            m = (r - l) / 2 + l;
            if(ok(piles, h, m)){
                r = m;
                continue;
            }
            l = m;
        } 

        return r;
    }

    private boolean ok(int[] piles, int h, int k) {
        for (int i : piles) {
            while (true) {
                h--;
                if (h < 0) {
                    return false;
                }
                i -= k;
                if (i <= 0) {
                    break;
                }
            }
        }

        return true;
    }

    public static void main(String[] args) {
        TestCase[] cases = new TestCase[] {
                new TestCase(new int[] { 3, 6, 7, 11 }, 8, 4)
        };

        Main m = new Main();
        for (TestCase testCase : cases) {
            int r = m.minEatingSpeed(testCase.piles, testCase.h);
            if (r != testCase.output) {
                
                throw new RuntimeException(r + "");
            }
        }
    }

    static class TestCase {
        int[] piles;
        int h;
        int output;

        public TestCase(int[] piles, int h, int output) {
            this.piles = piles;
            this.h = h;
            this.output = output;
        }
    }
}