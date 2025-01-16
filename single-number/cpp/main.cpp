#include <iostream>
#include <vector>
#include <set>

using namespace std;

class Solution
{
public:
    int singleNumber(vector<int> &nums)
    {
        int result = 0;
        for (int num : nums)
        {
            result ^= num; // XOR each number into result
        }
        return result;
    }
};

int main()
{
    std::cout << "hoge" << std::endl;
    vector<int> nums = {4, 3, 2, 1, 2};
    Solution solution;
    int result = solution.singleNumber(nums);
    std::cout << "The single number is: " << result << std::endl;
    return 0;
}
