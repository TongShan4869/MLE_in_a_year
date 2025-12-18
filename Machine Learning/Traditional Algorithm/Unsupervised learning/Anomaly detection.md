---
tags:
  - ML
  - MLE
  - unsupervised
---
# Density estimation
estimate probability of x being seen in dataset
- low probability: $p(x_{test})<\epsilon$
	- $\epsilon$ : small number
- example:
	- fraud detection
		- $x^{(i)}$ = features of user i's activities
		- model $p(x)$ from data
		- identify unusual users by checking which have $p(x)<\epsilon$
		- perform additional checks to identify real fraud vs. false alarms
	- manufacturing
		-  $x^{(i)}$ = features of product i
	- monitoring computers in a data center
		-  $x^{(i)}$ = features of machine i
			- memory use
			- number of disk accesses
			- CPU load / network traffic
# Gaussian Distribution
- say x is number
- probability of x is determined by a Gaussian with mean $\mu$, variance $\sigma^2$
# Algorithm
- choose n features x_i that you think might be indicative of anomalous examples
- fit parameters $\mu_1, ...\mu_n,\sigma^2_1,...\sigma^2_n$
- given new example x, compute p(x)
	- product of $p(x_1;\mu_1,\sigma^2_1)\times p(x_2;\mu_2,\sigma^2_2) \times ...\times p(x_n;\mu_n,\sigma^2_n)$
- anomaly if $p(x_{test})<\epsilon$
# Developing and evaluating on anomaly detection system
## Real-number evaluation
- when developing a learning algorithm (choosing features, etc)
- making decision is much easier if we have a way of evaluation our learning algorithm
- assume we have some labeled data, of anomalous and non-anomalous examples
- training set: $x^{(1)},x^{(2)},...x^{(m)}$ assume normal examples / not anomalous
	- y=0 for all training examples
- include a few anomalous examples in 
	- validation set  -> tune $\epsilon$ , tune features x_j
	- test set
- alternative
	- no test set
	- use if very few anomaly 
### evaluation
- fit model p(x) on training set 
- on a cross validation / test example x, predict 
- possible evaluation metrics
	- TP, FP, FN, TN
	- precision / recall
	- F1-score
- use cross validation set to choose parameter 
# Anomaly detection vs. Supervised learning
- Anomaly detection
	- very small number of positive examples and large number of negative examples
	- many different "types" of anomalies. 
		- hard for any algorithm to learn from positive examples what the anomalies look like
		- future anomalies may look nothing like any of the anomalous examples we've seen so far
	- Examples
		- fraud: detect emails you never seen
		- manufacturing: finding new previously unseen defects
		- monitoring machines in data center
- Supervised learning
	- large number of positive and negative examples
	- enough positive example for algorithm to get a sense of what positive examples are like
		- future positive examples likely to be similar to ones in training set
	- Examples
		- spam: detect emails you have seen before
		- manufacturing: finding new previously known previously seen defects
		- weather prediction
		- diseases classification
# Choosing what features to use
## Non-gaussian features
- plot the histogram of the data, if not look bell-shaped
- might be able to be transformed to normal (e.g., log(), exponential/root transformation)
## Error analysis for anomaly detection
- want p(x) >= large for normal examples x
- most common problem
	- p(x) is comparable for normal and anomalous examples
- add additional features that might capture what is normal and what is not
- 