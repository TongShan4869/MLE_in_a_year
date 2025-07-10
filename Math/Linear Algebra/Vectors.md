---
tags:
  - vector
  - LinearAlgebra
  - math
  - matrix
  - MLE
---
# Vectors
We will think of a **vector** as a list of numbers. We will usually write vectors as vertically oriented matrices. For example:
$$

\vec{v} = \begin{bmatrix} 1 \\ 2 \\ 3\end{bmatrix}

$$ 
## Vector dimensions
This is a $3$ dimensional vector because there are three numbers in the list. If there are $n$ numbers in the list we say that the vector is $n$ dimensional. The collection of all vectors of dimension $n$ is written $\mathbb{R}^n$ (read this as "arr enn").
We can visualize $\mathbb{R}^1$ as a number line, $\mathbb{R}^2$ as the $xy$ plane, and $\mathbb{R}^3$ as a 3D $xyz$-coordinate system.
## Vector span
- **Definition**: The **span** of a list of vectors $\vec{v}_1, \vec{v}_2, \vec{v}_3, ... ,\vec{v}_k$ is the collection of all linear combinations of those vectors.
- **Example**: The span of a single non-zero vector is just the line containing that vector.
- **Example**: The span of two vectors which are not on the same line is the plane containing the two vectors.
## Vector linear independence
- **Definitions:** A linear combination of a list of vectors is called **non-trivial** if at least one of the coefficients is not $0$. A list of vectors is called **linearly dependent** if there is a non-trivial linear combination of the vectors which equals the zero vector. If the only linear combination of the vectors which equals the zero vector is trivial, then the list is called **linearly independent**.
- If we have a linearly dependent list of vectors and the coefficient of one of the vectors $\vec{v}_j$ is not zero, then we can express that vector as a linear combination of the remaining vectors. So the span of the list is unchanged by removing $\vec{v}_j$.
	- On the other hand, removing any vector from a linearly independent list will change the span.
## Vector space Basis
- **Definition**: a **basis** is a set of **linearly independent** vectors that can be used as building blocks to make any other vector in the vector space
	- vectors are linearly independent
	- they span the vector space $\mathbf{V}$
- 
- Let $S$ be a subspace of $\mathbb{R}^n$. Then we can find a list of linearly independent vectors $\vec{v_1}, \vec{v_2}, ..., \vec{v}_k$ which span $S$. Such a list is called a **basis** for $S$. A subspace can have many different bases, but all of them will have the same number of vectors in them. We call this common number the **dimension** of the subspace.
- 
## Vector inner product - dot product
- **Inner product**: the inner product of two vectors in the space is a scalar, often denoted with angle brackets, $\langle \vec{a}, \vec{b}\rangle$
- **Dot product**: inner product spaces generalize Euclidean vector spaces, in which the inner product is the **dot product** or scalar product of Cartesian coordinates. 

$$\begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_n \end{bmatrix} \cdot \begin{bmatrix} w_1 \\ w_2 \\ \vdots \\ w_n \end{bmatrix} = v_1w_1 + v_2w_2 +v_3w_3 + \dots + v_nw_n$$
- **properties**
	* We can do "normal algebra" with dot products:
		* The distributive law $\vec{a} \cdot (\vec{b} + \vec{c}) = \vec{a} \cdot \vec{b} + \vec{a} \cdot \vec{c}$ 
		* The commutative law $\vec{a} \cdot \vec{b} = \vec{b} \cdot \vec{a}$ holds.
		* The zero vector works as you would expect $\vec{a} \cdot \vec{0} = 0$.
	* $\vec{v} \cdot \vec{v}$ is the square of the **length** of the vector $\vec{v}$. Writing $|\vec{v}|$ for the length, we can write $\vec{v} \cdot \vec{v} = |\vec{v}|^2$ 
		* Note: This is basically just a restatement of the Pythagorean theorem. For example, if $\vec{v} = \begin{bmatrix} a \\ b \end{bmatrix}$, then $\vec{v} \cdot \vec{v} = a^2 +b^2$ which is the square of the length of the vector by the Pythagorean Theorem.
	* $\vec{v} \cdot \vec{w} = |\vec{v}||\vec{w}| \cos(\theta)$ where $\theta$ is the **angle** between the two vectors.
		* In particular, if two vectors are perpendicular (aka **orthogonal**) then the angle between them is $90^\circ$ and $\cos(90^\circ) = 0$. So two vectors are orthogonal if their dot product is $0$.
- > It pains me to skip the beautiful development of these formulas, but this is a crash course! I recommend checking out the answers to [this question](https://math.stackexchange.com/questions/348717/dot-product-intuition) for some great intuition about how to link the algebra to the geometry here.
- **Note**: We can use the notation $\vec{v} \cdot \vec{w}$ interchangeably with $\langle \vec{v}, \vec{w} \rangle$. The latter notation is sometimes more readable.
- **General vs. Specific:** An inner product is a broader concept that can be defined on various vector spaces, while the dot product is a specific type of inner product used in Euclidean spaces.
## Orthogonal 
### **Orthogonal complement** $S^\perp$ (read "S perp") of a subspace $S$ is the collection of all vectors which are orthogonal to every vector in $S$:
$$

S^\perp = \{ \vec{v} \in \mathbb{R}^n : \vec{v} \cdot \vec{w} = 0 \textrm{ for all $\vec{w} \in S$}\}

$$ 
Examples:
* The orthogonal complement of $\{\vec{0}\}$ is all of $\mathbb{R}^n$.
* $S = \textrm{span}\left( \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}\right)$ is the $x$-axis. Then $S^\perp$ would be the collection of all vectors perpendicular to the $x$-axis, which is the $yz$ plane. In other words, $$S^\perp = \textrm{span}\left( \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}, \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}\right)$$ 
* $S = \textrm{span}\left( \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}, \begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix}\right)$ is a plane in $\mathbb{R}^3$. If a vector $\begin{bmatrix} x \\ y \\ z\end{bmatrix} \in S^\perp$ then:
$$

\begin{align*}

&\begin{cases}

\begin{bmatrix} x \\ y \\ z\end{bmatrix} \cdot \begin{bmatrix} 1 \\ 0 \\ 0\end{bmatrix} = 0\\

\begin{bmatrix} x \\ y \\ z\end{bmatrix} \cdot \begin{bmatrix} 1 \\ 1 \\ 1\end{bmatrix} = 0\\

\end{cases}\\

&\begin{cases}

x = 0\\

x+ y + z = 0\\

\end{cases}\\

&\begin{cases}

x = 0\\

z = -y \\

\end{cases}\\

\end{align*}

$$ 
so
$$

S^\perp = \left\{\begin{bmatrix} 0 \\ y \\ -y\end{bmatrix}: y \in \mathbb{R}\right\} = \textrm{span}\left(\begin{bmatrix} 0 \\ 1 \\ -1 \end{bmatrix}\right)

$$ 
In other words, the only vectors perpendicular to the plane spanned by $\begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}$ and $\begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix}$ are multiples of the vector $\begin{bmatrix} 0 \\ 1 \\ -1 \end{bmatrix}$.
- **Theorem**: If $S$ is any subspace of $\mathbb{R}^n$ and $\vec{v}$ is any vector in $\mathbb{R}^n$, then $\vec{v}$ can be uniquely decomposed into the sum of two vectors $\textrm{proj}_S(\vec{v}) \in S$ and $\vec{r} \in S^\perp$. $\textrm{proj}_S(\vec{v})$ is the vector in $S$ which is closest to $\vec{v}$ among all of the vectors in $S$. The difference between $\vec{v}$ and $\textrm{proj}_S(\vec{v})$ is $\vec{r}$.
- Note: I am using $\vec{r}$ to stand for "residual" in anticipation of applying this to fitting linear regression.

### **Orthonormal basis** of a subspace $S$ is a basis where each vector has length $1$ and where the basis vectors are pairwise orthogonal to each other.
Observation: if we can find an orthonormal basis for a subspace $S$, then the problem of projecting a vector orthogonally onto $S$ becomes easy.
Assume $\vec{e}_1, \vec{e}_2, \vec{e}_3, ... \vec{e}_k$ is an orthonormal basis of $S$ and $\vec{v}$ is a vector we want to project orthogonally onto $S$.
By the theorem we know that
$$\vec{v} = \textrm{proj}_S(\vec{v}) + \vec{r} \textrm{ where $\vec{r} \in S^\perp$}$$ 
Since $\vec{e}_1, \vec{e}_2, \vec{e}_3, ... \vec{e}_k$ is a basis for $S$ and $\textrm{proj}_S(\vec{v}) \in S$ we can write
$$

\textrm{proj}_S(\vec{v}) = c_1\vec{e}_1+ c_2\vec{e}_2+ c_3\vec{e}_3+ ... +c_k \vec{e}_k

$$ 
Now we have
$$\vec{v} = c_1\vec{e}_1+ c_2\vec{e}_2+ c_3\vec{e}_3+ ... +c_k \vec{e}_k + \vec{r}$$ 
If we can determine the value of each $c_j$ we are done. This is easy to do if we dot each side of the equation with $\vec{e}_j$. Note that $\vec{e}_i \cdot \vec{e}_j = 0$ unless $i = j$ when $\vec{e}_j \cdot \vec{e}_j = 1$. Also note that $\vec{r} \cdot \vec{e}_j = 0$ since $r \in S^\perp$.
$$

\begin{align*}

&\vec{e}_j \cdot \vec{v} = c_1\vec{e}_1 \cdot \vec{e}_j+ c_2\vec{e}_2 \cdot \vec{e}_j+ c_3\vec{e}_3 \cdot \vec{e}_j+ ... + c_j \vec{e}_j \cdot \vec{e}_j + ... +c_k \vec{e}_k \cdot \vec{e}_j + \vec{r} \cdot \vec{e}_j\\

& \vec{e}_j \cdot \vec{v} = 0 + 0 + 0 + ... + c_j (1) + ... + 0 + 0\\

&c_j =\vec{e_j} \cdot \vec{v}

\end{align*}

$$ 
So we find that if $\vec{e}_1, \vec{e}_2, \vec{e}_3, ... \vec{e}_k$ is an orthonormal basis of $S$ then we have the formula
$$

\textrm{proj}_S(\vec{v}) = \sum_{j=1}^{j=k} (\vec{v} \cdot \vec{e}_j)\vec{e_j}

$$ 
So we have reduced the problem of orthogonally projecting a vector into a subspace to the problem of finding an orthogonal basis for a subspace.
For that we will use the **Gram-Schmidt** process:
Let $S = \textrm{span}(\vec{v_1}, \vec{v_2}, ..., \vec{v_k})$ where the $\vec{v}_j$ are linearly independent.
We will find an orthonormal basis $\vec{e}_j$ of $S$ as follows:
* $\vec{e}_1 = \vec{v}_1/|\vec{v}_1|$
* If we already have $\vec{e}_1, \vec{e_2}, ..., \vec{e}_{j-1}$ then we construct $\vec{e}_j$ as follows:
* Project $\vec{v}_j$ orthogonally onto the span of $\vec{e}_1, \vec{e_2}, ..., \vec{e}_{j-1}$ using the formula obtained above:
$$ \vec{p}_j = \sum_{i=1}^{j-1} (\vec{v}_j \cdot \vec{e}_i) \vec{e}_i $$ 
* $\vec{r_j} = \vec{v}_j - \vec{p}_j$ will be orthogonal to all of the $\vec{e}_i$ generated so far.
* Set $\vec{e}_j = \vec{r}_j/|\vec{r}_j|$. This just scales $\vec{r}_j$ to be of length $1$.
##  Vector outer product
- Refer to [[Matrices]]
$$\mathbf{v} \otimes \mathbf{w}= \begin{bmatrix} v_1 \\ v_2 \\ \vdots \\ v_m \end{bmatrix} \otimes \begin{bmatrix} w_1 \\ w_2 \\ \vdots \\ w_n \end{bmatrix} = A = \begin{bmatrix} v_1w_1 & v_1w_2 & \dots & v_1w_n \\ v_2w_1 & v_2w_2 & \dots & v_2w_n \\ \vdots & \vdots & \ddots & \vdots \\ v_mw_1 & v_mw_2 & \dots & v_mw_n\end{bmatrix}$$
or 
$$(\mathbf{v} \otimes \mathbf{w})_{ij}=v_jw_j$$
> Give an example of how the outer product can be useful in ML.
