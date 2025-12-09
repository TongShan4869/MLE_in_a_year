---
tags:
  - ML
  - MLE
  - unsupervised
---
# Architecture
## Root node (top)
- starting feature to be splitting
## Decision nodes
- feature to be decide on and splitting
## Leaf nodes 
- make final prediction
# Decision Tree Learning
- How to choose what feature to split on at each node?
	- maximize purity / minimize impurity
- When do you stop splitting?
	- when a node is 100% one class
	- when splitting a node will result in the tree exceeding a **maximum depth**
		- root node is depth 0
		- the first decision node under the root is depth 1
		- etc
	- when improvement in purity score are below a threshold
	- when number of examples in a node is below a threshold
		- prevent overfitting
- **Pipeline: Recursive splitting**
	- start with all examples at the root node
	- calculate **information gain** for all possible features, and pick the one with the highest information gain
	- split dataset according to selected feature, and create left and right branches of the tree
	- keep repeating splitting process **until stopping criteria is met**
# Entropy
- a measure of **impurity**
- p1 = fraction of examples that are 1
	- `p1 = 3/6` -> `H(p1) = 1`
	- `p1 = 5/6` -> `H(p1) = 0.65`
	- `p1 = 2/6` -> `H(p1) = 0.92`
	- `p1 = 6/6` -> `H(p1) = 0`
	- `p1 = 0/6` -> `H(p1) = 0`
- p0 = 1 - p1
- $H(p_1) = -p_1log_2(p_1)-p_0log_2(p_0) = -p_1log_2(p_1)-(1-p_1)log_2(1-p_1)$
- Note: $0log(0)=0$
- Other metric: Gini score
# Choosing a split
- compute weighted entropy for each node
- then compute the difference of the entropy: i.e., **Information gain**
- ![[Screenshot 2025-12-05 at 11.44.22 AM.png]]
# One-hot encoding
- multi-categorical data
- e.g. ear shape of the animal:
	- pointy, floppy, round
	- if an animal is floppy, the code is [0,1,0]
# Continuous valued features
- splitting on continuous variable
- e.g., weight <= 8 lbs. (like a threshold)
- compute the information gain to choose the threshold
- test all different mid point value, and compute which has highest information gain
	- if you have 10 data, test 9 values
# Regression Trees
- model output the averaged value
- **choosing a split**
	- choose the largest **reduction of the weighted variance**
	- ![[Screenshot 2025-12-09 at 11.41.41 AM.png]]
# Tree ensemble
-  **Random forest**
- **Bagging on sample** / **Bootstrap**
	- Generating a tree sample
	- given training set of size m, for b=1 to B: use sampling with replacement to create a new training set of size m
	- train a decision tree on the new dataset: **bagged decision tree**
	- for many trees, maybe end up to the same root node
- **Bagging on feature** / **Feature randomness**
	- Randomizing the feature choice
	- at each node, when choosing a feature to use to split
	- if n features are available, pick a random subset of k < n features 
	- allow the algorithm to only choose from that subset of features
		- usually, `k=sqrt(n)`
- **Boosting**
	- boosted trees intuition:
		- given a training set of size m, for b=1 to B:
			- use sampling with replacement to create a new training set of size m
			- but instead of picking from all examples with equal (1/m) probability, make it more likely to **pick misclassified examples from previously trained trees**
			- train a new decision tree
	- XGBoost (eXtreme gradient boosting)
		- open source implementation 
		- fast efficient implementation
		- good choice of default splitting criteria and criteria for when to stop splitting
		- built in regularization to precent overfitting
		- highly competitive algorithm for ML competitions
		- `from xgboost import XGBClassifier`
		- `from xgboost import XGBRegressor`
# When to use decision trees?
## Decision trees and tree ensembles
- works well on tabular (structured) data
- not recommended for unstructured data (images, audio, text)
- fast
- small decision trees may be **human interpretable**
## [[Neural Network]]
- works well on all types of data including tabular (structured) and unstructured data
- may be slower than a decision tree
- works with transfer learning
- when building a system of multiple models working together, it might be easier to string together multiple neural networks