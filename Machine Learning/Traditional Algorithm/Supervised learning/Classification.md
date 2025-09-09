---
tags:
  - ML
  - MLE
  - supervised
---
# Logistic regression
## Binary classification
- two classes/categories
	- `y = false / true (0 / 1)`
	- negative / positive (absence / presence)
- why linear regression won't work?
	- adding some "outlier" way to the right datapoint will change the fitted line
	- but it actually shouldn't  change
## Sigmoid function
- i.e., logistic function
- output between 0 and 1
- $$g(z)=\frac{1}{1+e^{-z}}  \ 0<g(z)<1$$
- logistic regression function $$f_{\vec{w},b}(\vec{x})=g(\vec{w}\cdot\vec{x}+b)=\frac{1}{1+e^{-(\vec{w}\cdot\vec{x}+b)}}$$
- the output number is the "probability" that class is $1$
- $f_{\vec{w},b}(\vec{x})=0.7$ means 70% chance that $y$ is $1$
	- i.e., $f_{\vec{w},b}(\vec{x})=P(y=1|\vec{x};(\vec{w},b))$
- $P(y=0)+P(y=1)=1$
## Decision Boundary
- Commonly, linearly 0.5
	- when $f_{\vec{w},b}(\vec{x})>=0.5$
		- $g(z)>=0.5$
		- $z>=0$
- $z=\vec{w}\cdot\vec{x}+b=0$
- special case: **polynomial logistic regression**
	- circle boundary
	- e.g, $g(z)=g(w_1x_1^2+w_2x_2^2+b)$
		- $z=w_1x_1^2+w_2x_2^2+b=0$
## Cost function
- if use squared error for logistic regression: non-convex function
- $$  loss(f_{\mathbf{w},b}(\mathbf{x}^{(i)}), y^{(i)}) = \begin{cases}
    - \log\left(f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) & \text{if $y^{(i)}=1$}\\
    - \log \left( 1 - f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) & \text{if $y^{(i)}=0$}
  \end{cases}$$
- ![[Screenshot 2025-09-09 at 12.06.00 PM.png]]
- ![[Screenshot 2025-09-09 at 12.07.13 PM.png]]
- 