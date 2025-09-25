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
  

