---
tags:
  - ML
  - MLE
  - CS
  - supervised
  - unsupervised
link: https://www.coursera.org/specializations/machine-learning-introduction
---
>[!note] [Scikit learn](https://scikit-learn.org/1.5/index.html) is your best friend for this!

# Machine leanring definition
- **Definition**
	- Field of study that gives computer the ability to learn without being explicitly programmed - Arthur Samuel
# Machine learning Algorithms
- **[[Supervised learning]]**
	- rapid advancements used most in real-world applications
- **[[Unsupervised learning]]**
- recommender system 
- reinforcement learning

# Terminology
## Training set
- notation
	- $x$ = "input" variable / feature
	- $y$ = "output" variable / "target" variable
	- $m$ = number of training examples
	- $(x, y)$ = single training example
	- $(x^{(i)}, y^{(i)})$  = $i^{th}$ training example
- input features
- output targets
- training set -> learning algorithm -> $f$ function 
	- $x -> f -> \hat{y}$
	- $\hat{y}$ : y-hat prediction (estimated y)
## Parameters
- coefficient / weights
## Cost function
- **NOTE: Loss is defined to apply to one example. Cost is defined to combined loss.**
- use in training examples to find the best parameters for the model
	- e.g., linear regression: sum of error squared [[Regression]]
## **Gradient Decent**
- to minimize cost functions
	- want $min_{w,b}J(w,b)$
- Outline
	- start with some parameters $(w,b)$
	- find the most efficient direction to get down
	- until you find local minimum / converge
- Algorithm
	- $w = w-\alpha \dfrac{\partial}{\partial w}J(w,b)$
	- $b = b-\alpha \dfrac{\partial}{\partial b}J(w,b)$
	- $=$ is assignment NOT truth assertion
	- $\alpha$ learning rate: how big step you make
	- **Simultaneously update $w$ and $b$**
		- compute new $w$ and $b$
			- $tempw = w-\alpha \dfrac{\partial}{\partial w}J(w,b)$
			- $tempb = b-\alpha \dfrac{\partial}{\partial b}J(w,b)$ 
			- for $tempb$ use the prev $w$ not new $tempw$
		- update simultaneously
			- $w=tempw$
			- $b=tempb$
- **Learning rate $\alpha$**
	- if $\alpha$ too small, GD may be slow
	- if $\alpha$ too large, GD may overshoot, never reach minimum
		- diverge
	- can reach local minimum with fixed learning rate
		- derivtive becomes smaller
		- update steps become smaller
		- can reach minimum without decreasing learning rate
- Types of GD
	- Batch GD
	- Stochastic GD: one datapoint
	- Mini-batch GD

| **Type**                              | **Gradient Computation**              | **Speed**           | **Memory Usage** | **Convergence**                     | **Best For**                        |
| ------------------------------------- | ------------------------------------- | ------------------- | ---------------- | ----------------------------------- | ----------------------------------- |
| **Batch Gradient Descent**            | Entire dataset                        | Slow                | High             | Stable, can reach global minimum    | Small to medium datasets            |
| **Stochastic Gradient Descent (SGD)** | Single data point per iteration       | Fast (per update)   | Low              | Noisy, may bounce around minima     | Large datasets, online learning     |
| **Mini-batch Gradient Descent**       | Small batch (e.g., 32, 64)            | Moderate            | Moderate         | Good balance of speed/stability     | Deep learning, large datasets       |
| **Momentum**                          | Adds velocity term to gradient        | Faster than vanilla | Moderate         | Reduces oscillations, smoother path | High-dimensional spaces             |
| **Nesterov Accelerated Gradient**     | Looks ahead before computing gradient | Faster convergence  | Moderate         | More responsive than Momentum       | Deep nets with complex landscapes   |
| **Adagrad**                           | Scales learning rate per parameter    | Slows over time     | Moderate         | Quickly adapts, but may stop early  | Sparse features (e.g., NLP, vision) |
| **RMSprop**                           | Moving average of squared gradients   | Fast convergence    | Moderate         | Avoids Adagrad’s decay issue        | Non-stationary objectives           |
| **Adam**                              | Combines Momentum + RMSprop           | Very fast           | Moderate         | Efficient, widely used              | Most deep learning tasks            |

- Make sure gradient descent is working correctly
	- **learning curve**: $J(\vec w, b)$ vs # of iterations
		- should decrease after every iteration
		- converge when no longer decreasing
		- number of iterations needed varies
	- automatic convergence test
		- let $\epsilon$ be 10^-3
		- if  $J(\vec w, b)$ decreases by  $<= \epsilon$ in one iteration declare convergence
			- but $\epsilon$ is hard to define
- **Choose a good learning rate**
	- Identify problem with GD using learning curve
	- $\alpha$ is too big
		- learning curve bouncing
		- increasing learning rate
	- just set $\alpha$ to be a small number, cost function should decrease
		- if J increase -> bugs in the code
	- values of $\alpha$ to try:
		- ... 0.001 -> 0.003 -> 0.01 -> 0.03 -> 0.1 -> 0.3 -> 1 ...
		- increase by 3x
	- choose the $\alpha$ that converge fast and also consistently decreasing
## Feature engineering
- using intuition to design new features, by transforming or combining original features
- Polynomial [[Regression]]
## The Problem of Overfitting
- Concepts:
	- **Underfit**: does not fit the training set well
		- high **bias**
	- **Just right**: fit training set pretty well
		- **Generalization**
	- **Overfit**: first the training set extremely well
		- high **variance**
- **Addressing overfitting**
	- Collect more training data
	- Select features to include / exclude
		- useful features could be lost
	- **Regularization 
		- reduce the size of parameters $w_j$
	