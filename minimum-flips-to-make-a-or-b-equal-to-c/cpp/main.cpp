#include <iostream>

class Solution
{
public:
    int minFlips(int a, int b, int c)
    {
        int l = sizeof(c) * 8;
        int count = 0;
        for(int i = 0; i < l; i++){
            int cb = (c >> i) &1;
            int ab = (a >> i) &1;
            int bb = (b >> i) &1;
            if (cb) {
                if (!(ab | bb)) {
                   count++; 
                }
            }else {
                if (ab) {
                    count++;
                }
                if (bb) {
                    count++;
                }
            }
        }
        return count;
    }
};

int main(int argc, char const *argv[])
{
    Solution solution;
    int a = 2, b = 6, c = 5;
    int result = solution.minFlips(a, b, c);
    std::cout << "Minimum flips: " << result << std::endl;
    return 0;
}
