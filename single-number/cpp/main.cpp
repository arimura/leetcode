#include <iostream>
#include <vector>

using namespace std;

class Solution
{
public:
    int singleNumber(vector<int> &nums) {
        return 0;
    }
};

int main()
{
    std::cout << "hoge" << std::endl;
    vector<int> nums = {4, 1, 2, 1, 2};
    Solution solution;
    int result = solution.singleNumber(nums);
    std::cout << "The single number is: " << result << std::endl;
    return 0;
}

