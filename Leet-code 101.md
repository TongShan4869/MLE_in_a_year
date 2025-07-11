---
tags:
  - leetcode
  - CS
  - MLE
---
# 07/09/2025
## Greedy algorithm 
- 顾名思义，`贪心算法或贪心思想` (greedy algorithm) 采用贪心的策略，`保证每次操作都是局部最优的`，从而使最后得到的结果是`全局最优的`。
- 证明一道题能用贪心算法解决，有时远比用贪心算法解决该题更复杂。一般情况下，在简单操作后，具有明显的从局部到整体的递推关系，或者可以通过数学归纳法推测结果时，我们才会使用贪心算法。
### 分配问题
#### https://leetcode.com/problems/assign-cookies/
- time complexity `O(mlogm+nlogn+min(m,n)) => O(mlogm+nlogn)`
- space complexity `O(m+n+1) => O(m+n)`
- conventionally, `m` and `n` can go really large
#### https://leetcode.com/problems/candy/description/
- We solved by store candy distribution and compare from left to right and right to left
	- this is two-pass solution
- however, people can do it with one-pass solution 
	- peak / valley count
	- don't need to store the whole candy distribution
	- space complexity  = `O(1)`
	- see here: https://leetcode.com/problems/candy/solutions/4037646/99-20-greedy-two-one-pass/
### 区间问题
#### https://leetcode.com/problems/non-overlapping-intervals/description/
- sort first
- 重点在于你应该remove哪个 -> remove 尾部最大的那个！！因为你已经sort过了～
## 反思
- 遇到更难理解的解法，如果5分钟内搞不懂，先跳过！

# 07/10/2025
## 605 https://leetcode.com/problems/can-place-flowers/description/
- you can stop early!!
## 452 https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/
- don't over think!!!
- in greedy algorithm, just focus on the local optimization first, then general optimization
- when your index go from left to right, to find the overlap, always sort the end of the interval!
## 762 https://leetcode.com/problems/partition-labels/description/
## 122 https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/

