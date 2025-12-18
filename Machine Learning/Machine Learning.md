---
tags:
  - ML
  - MLE
  - CS
  - supervised
  - unsupervised
  - DNN
link: https://www.coursera.org/specializations/machine-learning-introduction
---
>[!note] [Scikit learn](https://scikit-learn.org/1.5/index.html) is your best friend for this!

# Machine leanring definition
- **Definition**
	- Field of study that gives computer the ability to learn without being explicitly programmed - Arthur Samuel
# Machine learning Algorithms
- **[[Supervised learning]]**
	- rapid advancements used most in real-world applications
	- [[Decision Tree]]
- **[[Unsupervised learning]]**
- **[[Neural Network]]**
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
		- **Definition**
			- reduce the size of parameters $w_j$
			- results in simpler model - less likely to overfit
			- **Cost function** 
				- **Ridge regularization** (i.e., L2)
					- $Loss=MSE+λ∑​βj^2​$ 
					- in linear regression:$$J(\mathbf{w},b) = \frac{1}{2m} \sum\limits_{i = 0}^{m-1} (f_{\mathbf{w},b}(\mathbf{x}^{(i)}) - y^{(i)})^2  + \frac{\lambda}{2m}  \sum_{j=0}^{n-1} w_j^2 \tag{1}$$$$ f_{\mathbf{w},b}(\mathbf{x}^{(i)}) = \mathbf{w} \cdot \mathbf{x}^{(i)} + b  \tag{2} $$
					- the weights can be super small near 0
					- When there are many features (p is large), but most of them are useful and you don’t want to discard any completely
					- When multicollinearity exists (features are highly correlated), Ridge can stabilize the solution
					- When you want the model to be more stable and prefer smoother coefficients
				- **LASSO** (i.e., L1)
					- $Loss=MSE+λ∑​∣βj​∣$
					- the weights can be exactly 0 -> some sort of feature selection
					- when the number of features is much larger than the number of sample (p >> n)
					- When there are many features, but you suspect that only a small subset of them are truly useful.
					- When you want to perform automatic feature selection (Lasso will shrink some coefficients exactly to zero).
					- When model interpretability is important, and you want to retain only a few key features.
				- **Elastic Net**
					- Cost function
					- $Loss=MSE+λ​_1∑∣βj​∣+λ_2​∑βj2​$
					- Combines the **feature selection** property of Lasso with the **stability** of Ridge.
					- Performs better in **high-dimensional settings** with **correlated features**.
					- Allows control over the balance between Lasso and Ridge by tuning$$\alpha=\frac{\lambda_1}{\lambda_1+\lambda_2}​$$
						- $\alpha = 1$ → pure Lasso
						- $\alpha = 0$ → pure Ridge
						- $0<\alpha < 1$ → Elastic Net
			- regularization parameter $\lambda$
				- penalize large $w$s
				- if $\lambda =0$ -> may overfit
				- if $\lambda$ very big-> $w$s became small / near 0 -> underfit
			- can include or exclude $b$
		- **Gradient Descent**
			- only $w_j$ changes
			- $f_{\mathbf{w}b}$
			$$\begin{align*}
\frac{\partial J(\mathbf{w},b)}{\partial w_j}  &= \frac{1}{m} \sum\limits_{i = 0}^{m-1} (f_{\mathbf{w},b}(\mathbf{x}^{(i)}) - y^{(i)})x_{j}^{(i)}  +  \frac{\lambda}{m} w_j \tag{2} \\
\frac{\partial J(\mathbf{w},b)}{\partial b}  &= \frac{1}{m} \sum\limits_{i = 0}^{m-1} (f_{\mathbf{w},b}(\mathbf{x}^{(i)}) - y^{(i)}) \tag{3} 
\end{align*}$$
			- instead of regular $w_j - updating terms$ , its now $(1-\alpha\frac{\lambda}{m})$, which is a scalar that slightly smaller than 1
				- this shrink the $w_j$ in GD
		- see how it apply to logistic regression in [[Classification]]

# Evaluating / Diagnosing models
## Train/Test  procedure
- fit parameter by minimizing cost function
- compute test error
- for classification problem
	- can use cost function
	- can also use: fraction of the test set and the fraction of the trainset that the model has misclassified
## Model selection 
- it will be biased if you choose parameter based on test set eval
## Training/validation set/test set procedure
- validation error
- use validation error to choose parameters
- then estimate generalization error using test set
- for classification problem
	- when there is a tie in model, can add another criteria to break it:
		- choose the one with a lower training error
		- a more common approach: choose the smaller model saving computational resources. 
## Bias and Variance
- High bias = **underfit**
	- $J_{train}$ is high
	- $J_{val}$ is high
	- $J_{val} \approx J_{train}$
- High variance = **overfit**
	- $J_{train}$ is low
	- $J_{val}$ is high
	- $J_{val}>>J_{train}$
- "Just right"
	- $J_{train}$ is low
	- $J_{val}$ is low
- High bias and high variance
	- less likely but happen when model overfit for some training data points but underfit on other points
	- $J_{train}$ is high
	- $J_{val}>>J_{train}$ 
### Regularization
- choosing parameters of $\lambda$
- based on $J_{train}$ and $J_{val}$ 
### Establishing a baseline level of performance
- what is the level of error you can reasonably hope to get to?
- human level performance
- competing algorithms performance
- guess based on experience
- Bias/variance examples
	- (training error - baseline) is large & (training error - validation error) is small -> high bias
	- (training error - baseline) is small & (training error - validation error) is large -> high variance
	- (training error - baseline) is large & (training error - validation error) is large -> high bias and high variance
## Learning curves
- `error` vs. `training set size`
- high bias
- ![[Screenshot 2025-12-02 at 11.30.49 AM.png]]
	- increasing training set size wont's be very helpful
- high variance
	- ![[Screenshot 2025-12-02 at 11.31.28 AM.png]]
	- increase the training set size likely to help
## Decide what to try next
- Debugging a learning algorithms with **bias** and **variance**
- Fix **high bias**
	- **get more complex model**
		- getting additional features
		- adding polynomial feature
		- try *decreasing* $\lambda$
- Fix **high variance**
	- **get more training examples**
	- **simplify the model**
		- try smaller sets of features
		- try *increasing* $\lambda$
- The bias and variance trade-off
	- Large neural networks are low bias machines
	- ![[Screenshot 2025-12-02 at 11.53.05 AM.png]]
	- Does it do well on the training set?
		- No -> high bias -> bigger network (! GPU issue) -> loopback
		- Yes ->
			- Does it do well on cross validation set?
				- No -> high variance -> more data ->loopback
				- Yes -> done!
	- A large neural network will usually do as well or better than a smaller one so long as regularization is chosen appropriately
	- Regularization for NN
		- in `Tensorflow`
			- `layer_1 = Dense(units=25, activation='relu', kernel_regularizer=L2(0.01))`
# Iterative loop of ML development
## Choose architecture
- model, data, etc
## Train model
## Diagnostics
- bias, variance
- **Error analysis**
	- manually examine the data points that are incorrect
	- see their pattern to decide what to do next for the model
	- if the data points are too big, randomly sample 
## Error metrics for skewed datasets
- y=1 in presence of rare class we want to detect
- **Precision** = True positives / predicted positive = true positives / (true pos + false pos)
- **Recall** = True positives / actual positives =  true positives / (true pos + false neg)
- Trade-off of precision and recall
	- Suppose we want to predict y=1 (rare disease) only if very confident
		- adjust threshold higher:0.5 -> 0.7
		- higher precision, lower recall
	- Suppose we want to avoid missing too many case of rare disease (when in doubt predict y=1)
		- adjust threshold lower: 0.5 -> 0.3, more generally predict 1
		- lower precision, higher recall
- F1 score
	- how to compare precision/recall numbers?
	- harmonic mean $F1 = \frac {1} {1/2(1/P+1/R)} = 2 \frac {PR}{P+R}$
	- emphasize on the small value of P or R
## Adding data
- Normally:
	- add more data of everything
	- add more data of the types where error analysis has indicated it might help
- techniques beyond getting brand new training examples (x,y): 
- **data augmentation**
	- modifying an existing training exampler to create a new training example
	- e.g., distortion of the image: rotation, scale, mirror, etc.
	- e.g., audio: background noise, bad cellphone connection...
- **Data synthesis**
	- photo OCR tasks: generate from fonts
## Transfer learning
- **Supervised pre-training**: Train all parameters
- **Fine-tuning**: only train output layers parameters
- Pipeline:
	- Download NN parameters pretrained on a large dataset with same input type
	- Further train (fine-tune) the network on your own data
# Full cycle of a ML project
1. **Scope project**: define project
2. **Collect data**: define and collect data
3. **Train model**: training, error analysis, iterative improvement
4. **Deploy in production**: deploy, monitor and maintain system
	- Mobile app -> API call -> Inference server (ML model) -> Inference -> Mobile app
	- Software engineering (**MLOps**) may be needed for
		- Ensure reliable and efficient predictions
		- Scaling
		- Logging
		- System monitoring
	- See more in [[Machine learning system design]] and [[System Design]]
## Fairness, Bias and Ethics
### Bias
- e.g.
	- hiring tool that discriminates against women
	- facial recognition system matching dark skinned individual s to criminal mugshots
	- biased back loan approvals
- Adverse use cases like deepfake
### Guidelines
- diverse team with emphasis
- carry out literature search on standards/guidelines for your industry


