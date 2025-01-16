#include <iostream>
#include <vector>
#include <set>

using namespace std;

class Solution
{
public:
    int singleNumber(vector<int> &nums) {
        set<int> s;
        for(int n : nums) {
            if (s.find(n) != s.end()){
                s.erase(n);
            }else {
                s.insert(n);
            }
        }

        auto b = s.begin();
        return *b;
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

