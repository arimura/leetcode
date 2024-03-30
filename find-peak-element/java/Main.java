
class Main {
    public int findPeakElement(int[] nums) {
        
    }

    public static void main(String[] args) {
        Main main = new Main();
        TestCase[] testCases = {
            new TestCase(new int[]{1, 2, 3, 1}, 2),
            new TestCase(new int[]{1, 2, 1, 3, 5, 6, 4}, 5)
        };

        for (TestCase testCase : testCases) {
            int output = main.findPeakElement(testCase.nums);
            if (output != testCase.output) {
                throw new RuntimeException(testCase.nums.toString());
            }
        }
    }

    static class TestCase {
        int[] nums;
        int output;

        public TestCase(int[] nums, int output) {
           this.nums = nums;
            this.output = output;
        }
    }
}

