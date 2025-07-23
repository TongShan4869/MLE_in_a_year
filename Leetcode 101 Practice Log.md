---
tags:
  - leetcode
  - CS
  - MLE
link: https://noworneverev.github.io/leetcode_101/
---
# 07/09/2025 Greedy algorithm 
- 顾名思义，`贪心算法或贪心思想` (greedy algorithm) 采用贪心的策略，`保证每次操作都是局部最优的`，从而使最后得到的结果是`全局最优的`。
- 证明一道题能用贪心算法解决，有时远比用贪心算法解决该题更复杂。一般情况下，在简单操作后，具有明显的从局部到整体的递推关系，或者可以通过数学归纳法推测结果时，我们才会使用贪心算法。
## 分配问题
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
## 区间问题
### [\#435 Non-overlapping intervals](https://leetcode.com/problems/non-overlapping-intervals/description/)
- sort first
- 重点在于你应该remove哪个 -> remove 尾部最大的那个！！因为你已经sort过了～
## 反思
- 遇到更难理解的解法，如果5分钟内搞不懂，先跳过！

# 07/10/2025 Practice questions
### [\#605 Can Place Flowers](https://leetcode.com/problems/can-place-flowers/description/)
- you can stop early!!
### [\#452 Minimum number of arrows to burst balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/description/)
- don't over think!!!
- in greedy algorithm, just focus on the local optimization first, then general optimization
- when your index go from left to right, to find the overlap, always sort the end of the interval!
### [\#762 Partition labels](https://leetcode.com/problems/partition-labels/description/)
### [\#122 Best Time to buy and sell](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/description/)

# 07/15/2025 Practice questions
### [406. Queue Reconstruction by Height](https://leetcode.com/problems/queue-reconstruction-by-height/)
- don't need to check if condition met because we already sorted!!
- don't think a lot for checking and looping when you already did sorting, condition maybe already met because of the algorithm!
### [665. Non-decreasing Array](https://leetcode.com/problems/non-decreasing-array/)

# 07/18/2025 Two pointers
- 双指针主要用于遍历数组，两个指针指向不同的元素，从而协同完成任务。也可以延伸到多个数组的多个指针。
- 若两个指针指向同一数组，遍历方向相同且不会相交，则也称为滑动窗口（两个指针包围的区域即为当前的窗口），经常用于区间搜索。
- 若两个指针指向同一数组，但是遍历方向相反，则可以用来进行搜索，待搜索的数组往往是排好序的。
## Two sum
### [167. Two Sum II - Input array is sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
- two related questions
	- [1. Two Sum](https://leetcode.com/problems/two-sum//)
	- [1099. Two Sum - less than k](https://leetcode.com/problems/two-sum-less-than-k/description/)
## 归并两个有序数组
### [88. Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/)

# 07/21/2025 Two pointers
## 滑动窗口
### [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
- Expand using right pointer, and shrink using left pointer!!!!
	- starting from start and end = 0, move right pointer until all the character and frequency in t are in the window
	- then move left pointer until the requirement is still met
	- then move right pointer again until met
## 快慢指针
### [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
- a = kc - b
- **对于链表找环路的问题，有一个通用的解法——快慢指针**（Floyd 判圈法）。给定两个指针，分别命名为 slow 和 fast，起始位置在链表的开头。每次 fast 前进两步，slow 前进一步。如果 fast 可以走到尽头，那么说明没有环路；如果 fast 可以无限走下去，那么说明一定有环路，且一定存在一个时刻 slow 和 fast 相遇。当 slow 和 fast 第一次相遇时，我们将 fast 重新移动到链表开头，并 让 slow 和 fast 每次都前进一步。当 slow 和 fast 第二次相遇时，相遇的节点即为环路的开始点。
## 练习
### [633. Sum of Square Numbers](https://leetcode.com/problems/sum-of-square-numbers/)
- constrain the range (0, sqrt(c))!!! to reduce the time complexity
### [680. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)

# 07/23/2025 Two pointers
### [524. Longest Word in Dictionary through Deleting](https://leetcode.com/problems/longest-word-in-dictionary-through-deleting/)
- sort dictionary long to short and lexicographic
### [340. Longest Substring with At Most K Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)
- always update the pointers after the condition check
- the shrinking is conditioned on expanding, you always need to increase right index, otherwise if will not exit the while loop!!!
