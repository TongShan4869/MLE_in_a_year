---
tags:
  - ML
  - MLE
  - supervised
  - classification
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
- **NOTE: Loss is defined to apply to one example. Cost is defined to combined loss.**
- if use squared error for logistic regression: non-convex function
- $$  loss(f_{\mathbf{w},b}(\mathbf{x}^{(i)}), y^{(i)}) = \begin{cases}
    - \log\left(f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) & \text{if $y^{(i)}=1$}\\
    - \log \left( 1 - f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) & \text{if $y^{(i)}=0$}
  \end{cases}$$
- ![[Screenshot 2025-09-09 at 12.06.00 PM.png]]
- ![[Screenshot 2025-09-09 at 12.07.13 PM.png]]
- Simplified Cost function
- the cost function is of the form 

$$ J(\mathbf{w},b) = \frac{1}{m} \sum_{i=0}^{m-1} \left[ loss(f_{\mathbf{w},b}(\mathbf{x}^{(i)}), y^{(i)}) \right] \tag{1}$$

where
* $loss(f_{\mathbf{w},b}(\mathbf{x}^{(i)}), y^{(i)})$ is the cost for a single data point, which is:

    $$loss(f_{\mathbf{w},b}(\mathbf{x}^{(i)}), y^{(i)}) = -y^{(i)} \log\left(f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) - \left( 1 - y^{(i)}\right) \log \left( 1 - f_{\mathbf{w},b}\left( \mathbf{x}^{(i)} \right) \right) \tag{2}$$
    
*  where m is the number of training examples in the data set and:
$$
\begin{align}
  f_{\mathbf{w},b}(\mathbf{x^{(i)}}) &= g(z^{(i)})\tag{3} \\
  z^{(i)} &= \mathbf{w} \cdot \mathbf{x}^{(i)}+ b\tag{4} \\
  g(z^{(i)}) &= \frac{1}{1+e^{-z^{(i)}}}\tag{5} 
\end{align}
$$
## Logistic Gradient Descent
Recall the gradient descent algorithm utilizes the gradient calculation:
$$\begin{align*}
&\text{repeat until convergence:} \; \lbrace \\
&  \; \; \;w_j = w_j -  \alpha \frac{\partial J(\mathbf{w},b)}{\partial w_j} \tag{1}  \; & \text{for j := 0..n-1} \\ 
&  \; \; \;  \; \;b = b -  \alpha \frac{\partial J(\mathbf{w},b)}{\partial b} \\
&\rbrace
\end{align*}$$

Where each iteration performs simultaneous updates on $w_j$ for all $j$, where
$$\begin{align*}
\frac{\partial J(\mathbf{w},b)}{\partial w_j}  &= \frac{1}{m} \sum\limits_{i = 0}^{m-1} (f_{\mathbf{w},b}(\mathbf{x}^{(i)}) - y^{(i)})x_{j}^{(i)} \tag{2} \\
\frac{\partial J(\mathbf{w},b)}{\partial b}  &= \frac{1}{m} \sum\limits_{i = 0}^{m-1} (f_{\mathbf{w},b}(\mathbf{x}^{(i)}) - y^{(i)}) \tag{3} 
\end{align*}$$

* m is the number of training examples in the data set      
* $f_{\mathbf{w},b}(x^{(i)})$ is the model's prediction, while $y^{(i)}$ is the target
* For a logistic regression model  
    $z = \mathbf{w} \cdot \mathbf{x} + b$  
    $f_{\mathbf{w},b}(x) = g(z)$  
    where $g(z)$ is the sigmoid function:  
    $g(z) = \frac{1}{1+e^{-z}}$   

```python
def compute_gradient_logistic(X, y, w, b): 
"""
Computes the gradient for logistic regression 

Args:
  X (ndarray (m,n): Data, m examples with n features
  y (ndarray (m,)): target values
  w (ndarray (n,)): model parameters  
  b (scalar)      : model parameter
Returns
  dj_dw (ndarray (n,)): The gradient of the cost w.r.t. the parameters w. 
  dj_db (scalar)      : The gradient of the cost w.r.t. the parameter b. 
"""
m,n = X.shape
dj_dw = np.zeros((n,))                           #(n,)
dj_db = 0.

for i in range(m):
	f_wb_i = sigmoid(np.dot(X[i],w) + b)          #(n,)(n,)=scalar
	err_i  = f_wb_i  - y[i]                       #scalar
	for j in range(n):
		dj_dw[j] = dj_dw[j] + err_i * X[i,j]      #scalar
	dj_db = dj_db + err_i
dj_dw = dj_dw/m                                   #(n,)
dj_db = dj_db/m                                   #scalar
	
return dj_db, dj_dw 
```

## Regularized logistic regression
- Cost function
- 