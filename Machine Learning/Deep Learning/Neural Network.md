---
tags:
  - ML
  - MLE
  - DNN
  - AI
---
# History
- origin: mimic brain
- used in 1980s - 1990s, resurgence from 2005
- speech -> image -> NLP -> ...
- Simplified mathematical models of a neuron
	- input value -> neuron(s)-> output values
# Basic concepts
## Activation
- activation neuron as a logistic regression operator
	- to predict 0/1 
	- output = a = probability of a item is top seller
## Layer
- group of neurons
- output one value from several features (i.e., activation values)
	- e.g., affordability, awareness, quality, etc.
- every neuron in a layer will receive all values from input layers
- input layer $\vec{x}$  -> "hidden" layer -> $\vec{a}$ -> output layer -> $a$ (one number)
- notation for layer: superscript $^{[1]}$ means layer 1's parameter
	- e.g., $\vec{w}^{[1]}_1$ the weight vector of neuron 1 in layer 1
	- $\vec{a}^{[1]}$ the activation vector from layer 1
	- for $j$ th neuron in layer $l$: $$a_j^{[l]}=g(\vec{w}_j^{[l]}\cdot\vec{a}^{[l-1]}+b_j^{[l]})$$
## Example: Face recognition
- input: picture 1000x1000 pi
	- 1 million value- vector
- each layer learn something
	- e.g., 1st layer learn edges
		- 2nd layer learn the shape of eye/noses/ mouth/etc
		- 3rd layer learn the overall face feature
	- learning window getting larger and larger

## Inference (forward propagation)
- making prediction
- compute from left to right
- number of neurons in a hidden layer decreases when the layer number increases

# `Tensorflow`
- Layer
	- `x = np.array([[200, 17]])```
	- `layer_1 = Dense(unit=3, activation='sigmoid')`
	- `a1 = layer_1(x)`
- Feature vector / Tensor
	- 2D vector
		- in numpy: `x = np.array([[200, 17]])` - double bracket
			- 1 x 2 matrix
		- instead of `x = np.array([200, 17])` - single bracket
			- 1D vector
	- `a1 = layer_(x)`
		- `a1 = [[0.2, 0.7, 0.3]]`, a 1x3 matrix as a tensor
		- `tf.Tensor([[0.2, 0.7, 0.3]], shape=(1,3), dtype=float32)`
- Build NN in `Tensorflow`
	-  `model = Sequential([layer_1, layer_2])
	- `model.compile()`
	- `model.fit(x,y)`
	- `model.predict(x_new)`
- Forward propagation
```python
  def dense(a_in,W,b):
	  units = W.shape[1]
	  a_out = np.zeros(units)
	  for j in range(units):
		  w = W[:,j]
		  z = np.dot(w, a_in) + b[j]
		  a_out[j] = g(z)
	  return a_out
	  
  def sequential(x):
	  a1 = dense(x,W1,b1)
	  a2 = dense(a1,W2,b2)
	  a3 = dense(a2,W3,b3)
	  a4 = dense(a3,W3,b3)
	  f_x = a4
	  return f_x
  ```
  

# Train a NN in `TensorFlow`
## Specify model
- `Sequential`

- 
## Compile
- with loss function
- `model.compile(loss=BinaryCrossentropy())`
- Binary Cross Entropy loss function
	- similar to the loss for logistic regression
	- `from tensorflow.keras.losses import BinaryCrossentropy`
		- alternatively, for regression task: `from tensorflow.keras.losses import MeanSquareError`
- note: **cost function** is the average of **loss function** from all training data
## Fit
- Gradient Decent to minimize cost
- **Back propagation**
- `model.fit(X,y, epochs=100)`

## Activation function
### Functions
- linear activation g(z) =z
	- sometimes refer to "No activation function"
- Sigmoid 0<g(z)<1
- Rectified linear unit (ReLU)
	- g(z)= max(0,z)
	- if z<0, g(z) = 0, if z >=0, g(z) = z
- Softmax
- LeakyReLU, tanh, etc...
### How to choose?
- Output layer depends on the task
	- binary classification: sigmoid
	- regression
		- linear activation, y=- or +, e.g., stock change
		- ReLU: y>=0
- Hidden layer
	- **ReLU**: most common choice
	- faster to compute
	- `Dense(unit=25, activation='relu')`
### Why activation function?
- if you don't use activation, it become a regular linear regression model
- NN is better bc its non-linearity

# Multiclass Classification Problem
## Softmax activatioon
- $$a_j = \frac{e^{z_j}}{ \sum_{k=1}^{N}{e^{z_k} }} \tag{1}$$
- Crossentropy Loss
- $$\begin{equation}
  L(\mathbf{a},y)=\begin{cases}
    -log(a_1), & \text{if $y=1$}.\\
        &\vdots\\
     -log(a_N), & \text{if $y=N$}
  \end{cases} \tag{3}
\end{equation}$$
## Softmax in Tensorflow
- `activation ='softmax'`
- `loss = SparseCategoricalCrossentropy()` -> not recommended here!
- Numerical roundoff errors
	- do it in numerically stable way
	- Logistic regression
		- `activation='linear'`
		- `model.complie(loss=BinaryCrossEntropy(from_logits=True))`
	- Softmax
		- `activation='linear'` -> output `z_j` not `a_j`
		- `model.complie(loss=SparseCategoricalCrossEntropy(from_logits=True))`
		- to predict: `f_x=tf.nn.softmax(logits)`
##  `SparseCategorialCrossentropy` or `CategoricalCrossEntropy`
Tensorflow has two potential formats for target values and the selection of the loss defines which is expected.
- `SparseCategorialCrossentropy`: expects the target to be an integer corresponding to the index. For example, if there are 10 potential target values, y would be between 0 and 9. 
- `CategoricalCrossEntropy`: Expects the target value of an example to be one-hot encoded where the value at the target index is 1 while the other N-1 entries are zero. An example with 10 potential target values, where the target is 2 would be [0,0,1,0,0,0,0,0,0,0].
# Multi-label Classification Problem
- single object may have multiple labels
	- a picture can contain car/bus/pedestrian at the same time
- make output layer with N sigmoid activations (not softmax)

# Optimization
## Adam algorithm
- adaptive moment estimation
- if w_j or b keeps moving in same direction, increase $\alpha$
- if w_j or b keeps oscillating, decrease $\alpha$
- `model.complie(optimizer=tf.keras.optimizers.Adam(learningrate=1e-3))`
# Additional layer types
## convolutional layer
- each neuron only looks at part of the previous layers' output
- convolutional neural network
	- e.g., EKG
# Backprop
- cost function take derivative
	- if derivative is small, then this update step will make a small update to $w_j$
	- if the derivative is large, then this update step will make a large update to $w_j$ 
``
```python
import sympy
J, w = sympy.symbols('J,w')
J = w**2
dJ_dw = sympy.diff(J,w)
dJ_dw.subs([w,2])
```
- $d$ for derivative
- $\partial$ for partial derivative
# Computation graph
- Forward prop
- ![[Screenshot 2025-10-15 at 11.21.22 AM.png]]
- Back prop
- ![[Screenshot 2025-10-15 at 11.28.45 AM.png]]
- Intuition in NN
	- 