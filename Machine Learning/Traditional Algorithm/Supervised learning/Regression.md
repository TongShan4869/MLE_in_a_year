---
tags:
  - MLE
  - ML
  - supervised
---
Predicts numbers
# Linear regression
 - a statistical method that models the linear relationship between a output / dependent variable and one or more input / independent variables
- Fit a straight line / hyperplane to the data
## Univariate linear regression 
- linear regression with one variable
- represent $f$
	- $f_{w,b}(x) = wx+b$
	- $f(x)=wx+b$
- $w$ and $b$ is parameters/weights/coefficients
	- $w$ is slope
	- $b$ is y-axis intercept
- find $w, b$ where  y_hat is close to y_i for all (x_i, y_i)
- Cost function: use in training examples to find the best parameters
	- Sum of error squared: error^2 = $(\hat{y}^i-y^i)^2$
	- $J(w,b)=\dfrac{1}{2m} \sum_{i=1}^m{(\hat{y}^i-y^i)^2}$
	- $J(w,b)=\dfrac{1}{2m} \sum_{i=1}^m{(f_{w,b}(x^i)-y^i)^2}$
	- $m$: number of **training** examples
	- Goal: $minimize_{w,b}J(w,b)$
		- $J(w,b)$: 3D surface plot looks like a  soup bowl
		- or you can plot contour plot
	- Gradient Decent algorithm 
		- [[Machine Learning]]
		- used Batched gradient decent
	- More than one local minimum
	- Squared error cost: convex function
		- global minumum
	- 