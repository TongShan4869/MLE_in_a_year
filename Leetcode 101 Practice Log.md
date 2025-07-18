---
tags:
  - leetcode
  - CS
  - MLE
link: https://noworneverev.github.io/leetcode_101/
---
# 07/09/2025
## Greedy algorithm 
- 顾名思义，`贪心算法或贪心思想` (greedy algorithm) 采用贪心的策略，`保证每次操作都是局部最优的`，从而使最后得到的结果是`全局最优的`。
- 证明一道题能用贪心算法解决，有时远比用贪心算法解决该题更复杂。一般情况下，在简单操作后，具有明显的从局部到整体的递推关系，或者可以通过数学归纳法推测结果时，我们才会使用贪心算法。
### 分配问题
### [\#455 Assign Cookies](https://leetcode.com/problems/assign-cookies/)
- time complexity `O(mlogm+nlogn+min(m,n)) => O(mlogm+nlogn)`
- space complexity `O(m+n+1) => O(m+n)`
- conventionally, `m` and `n` can go really large
### [\#135 Candy](https://leetcode.com/problems/candy/description/)
- We solved by store candy distribution and compare from left to right and right to left
	- this is two-pass solution
- however, people can do it with [one-pass solution](https://leetcode.com/problems/candy/solutions/4037646/99-20-greedy-two-one-pass/)!
	- peak / valley count
	- don't need to store the whole candy distribution
	- space complexity  = `O(1)`
### 区间问题
### [\#435 Non-overlapping intervals](https://leetcode.com/problems/non-overlapping-intervals/description/)
- sort first
- 重点在于你应该remove哪个 -> remove 尾部最大的那个！！因为你已经sort过了～
## 反思
- 遇到更难理解的解法，如果5分钟内搞不懂，先跳过！

# 07/10/2025
## Practice questions
### [\#605 Can Place Flowers](https://leetcode.com/problems/can-place-flowers/description/)
- you can stop early!!
### [\#452 Minimum number of arrows to burst balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/)
- don't over think!!!
- in greedy algorithm, just focus on the local optimization first, then general optimization
- when your index go from left to right, to find the overlap, always sort the end of the interval!
### [\#762 Partition labels](https://leetcode.com/problems/partition-labels/description/)
### [\#122 Best Time to buy and sell](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/)

# 07/15/2025
## Practice questions
### [406. Queue Reconstruction by Height](https://leetcode.com/problems/queue-reconstruction-by-height/)
- don't need to check if condition met because we already sorted!!
- don't think a lot for checking and looping when you already did sorting, condition maybe already met because of the algorithm!
### [665. Non-decreasing Array](https://leetcode.com/problems/non-decreasing-array/)