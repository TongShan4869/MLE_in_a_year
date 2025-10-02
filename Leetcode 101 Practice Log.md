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
# 07/30/2025 Binary Search
- `二分查找`也常被称为`二分法`或者`折半查找` (binary search, bisect)，每次查找时通过将待查找的单调区间分成两部分并只取一部分继续查找，将查找的复杂度大大减少。对于一个长度为 O(n)O(n) 的数组，二分查找的时间复杂度为 O(log⁡n)O(logn)。
- 具体到代码上，二分查找时区间的左右端取开区间还是闭区间在绝大多数时候都可以，因此有些初学者会容易搞不清楚如何定义区间开闭性。这里笔者提供两个小诀窍，第一是尝试熟练使用一种写法，比如左闭右开（满足 C++、Python 等语言的习惯）或左闭右闭（便于处理边界条件），尽量只保持这一种写法；第二是在刷题时思考如果最后区间只剩下一个数或者两个数，自己的写法是否会陷入死循环，如果某种写法无法跳出死循环，则考虑尝试另一种写法。
- Binary search example codes: ```
```python
def recursion(array,target,left,right):
    if left > right:
        return False
    mid = left + (right-left)//2
    if array[mid] == target:
        return True
    elif target < array[mid]: # search left half
        return recursion(array,target,left,mid-1)
    else: # search right half
        return recursion(array,target,mid+1,right)

def iteration(array,target,left,right):
    left, right = 0, len(array)-1
    while left <= right:
        mid = left + (right-left)//2
        if array[mid] == target:
            return True
        elif target < array[mid]:
            right = mid-1
        else:
            left = mid+1
    return False
```
### [69. Sqrt(x)](https://leetcode.com/problems/sqrtx/)
- Normal Approach: Binary Search
	- Why return right always correct?
	- because when exit while loop, left is always bigger than right. Consider two conditions:
	- condition 1
		- pivot^2 < x: left = pivot + 1, exit
		- left > right, left = right+1, right = pivot
		- right^2 < x but left^2 > x -> return right
	- condition 2
		- pivot^2 > x: right = pivot - 1, exit
		- left > right, left = right+1, left = pivot
		- left^2 > x but right^2 < x -> return right
- Other approach: Recursion + Bit Shifts
	- Let's use recursion. Bases cases are x​=x for x<2. Now the idea is to decrease x recursively at each step to go down to the base cases.
	- That means one could rewrite the recursion above as `mySqrt(x)=mySqrt(x>>2)<<1`
### [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)
- define two functions
	- `find_first`
		- that's when you find a target, search left
	- `find_last`
		- that's when you find a target, search right

```python
class Solution:
	def searchRange(self, nums:List[int], target:int) -> List[int]:
		def find_first(nums, target):
			left = 0
			right = len(nums)-1
			while left <= right:
				pivot = left+(right-left)//2
				if num[pivot] >= x:
					right = pivot-1
				elif num[pivot] < x:
					left = pivot+1
				return left if (left < len(nums)) and (nums[right]==target) else -1
				
		def find_last(nums, target):
			left = 0
			right = len(nums)-1
			while left <= right:
				pivot = left+(right-left)//2
				if num[pivot] <= x:
					right = pivot-1
				elif num[pivot] < x:
					left = pivot+1
				return right if (right >= 0) and (nums[right]==target) else -1
				
		return [find_first(nums, target), find_last[nums, target]]		
```

### [162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)
- optimal and simplest solution:
```python
class Solution:
	def findPeakElement(self, nums: List[int]) -> int:
		l = 0
		r = len(nums) - 1
		while l < r:
			mid = (l + r) // 2
			if nums[mid] > nums[mid + 1]:
				r = mid
			else:
				l = mid + 1
		return l # leave while loop when l=r=peak, return whatever
```
- Inside the loop, always shrink the interval toward the side that contains peak, and includes the potential peak!!!
### [81. Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/)
```python
def search(self, nums: List[int], target: int) -> bool:
	# Define left and right index
	l, r = 0, len(nums)-1
	while l <= r:
		# find mid
		mid = l+(r-l)//2
		# if find mid == target
		if nums[mid] == target:
			return True
		# shrink the nums list if mid == left or if mid == right
		elif nums[mid] == nums[l]:
			l += 1
		elif nums[mid] == nums[r]:
			r -= 1
		# if mid > l, left part is non-decreasing for sure
		elif nums[mid] > nums[l]:
			# if mid > target > l, search left
			# if target < l or target > mid, search right
			if target >= nums[l] and target < nums[mid]:
				r = mid - 1
			else:
				l = mid + 1
		# if mid < l, right part is non-decreasing for sure
		elif nums[mid] < nums[l]:
			# if mid < target < r, search right
			# if target > r, search left
			if target <= nums[r] and target > nums[mid]:
				l = mid + 1
			else:
				r = mid - 1
	return False
```

### [154. Find Minimum in Rotated Sorted Array II](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/)
```python
def findMin(self, nums: List[int]) -> int:
	left, right = 0, len(nums)-1
	while left < right:
		mid = left + (right - left) // 2
		if nums[mid] > nums[right]:
			left = mid + 1
		elif nums[mid] < nums[right]:
			right = mid
		else: # if equal
			right -= 1
	return nums[left]
```
### [540. Single Element in a Sorted Array](https://leetcode.com/problems/single-element-in-a-sorted-array/)
```python
def singleNonDuplicate(self, nums: List[int]) -> int:
	# the length of nums is always odd
	# find the mid
	# consider if the window left and right is odd or even
	left, right = 0, len(nums)-1
	while left < right:
		mid = left + (right-left)//2
		half_window = mid - left
		# MISTAKE: YOU MUST CHECK IF MID AND MID-1 AND MID+1 EQUAL!
		if nums[mid] != nums[mid-1] and nums[mid] != nums[mid+1]: # if using & then you must add () to logical comments!!!
			return nums[mid]
		if nums[mid] == nums[mid-1]:
			if half_window % 2:
			left = mid + 1
			else:
			right = mid - 2 # MISTAKE: YOU MUST DELETE BOTH TO MAKE SURE THAT THE WINDOW IS ODD LENGTH!!
		elif nums[mid] == nums[mid+1]:
			if half_window % 2:
			right = mid - 1
			else:
			left = mid + 2 # YOU MUST DELETE BOTH TO MAKE SURE THAT THE WINDOW IS ODD LENGTH!!
	return nums[left] # return nums[right] also work, because when exit loop, left == right
```
