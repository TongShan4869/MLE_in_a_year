---
tags:
  - matrix
  - LinearAlgebra
  - vector
  - math
  - MLE
---
# Linear Transformation
reference: https://www.youtube.com/watch?v=kYB8IZa5AuE&ab_channel=3Blue1Brown
## Definition
- A **linear transformation** is any function $L : \mathbb{R}^n \to \mathbb{R}^m$ which satisfies the following two conditions:
	Respects vector sums: If $\vec{v},\vec{w} \in \mathbb{R}^n$ are any two vectors then
$$
L(\vec{v} + \vec{w}) = L(\vec{v}) + L(\vec{w})
$$
	 Respects scalar multiplication: If $c \in \mathbb{R}$ is any scalar and $\vec{v} \in \mathbb{R}^n$ is any vector then
$$
L(c\vec{v}) = cL(\vec{v})
$$

**Idea**: If you know the outputs of a linear transformation $L: \mathbb{R}^n \to \mathbb{R}^m$ for each of the standard basis vectors $\vec{e}_1, \vec{e}_2, \vec{e}_3, ..., \vec{e}_n$, then you can figure out what the output of $L$ is for *any* input by taking an appropriate linear combination of the basis vector outputs.
We record this information in a **matrix** (2 dimensional array of numbers) as follows:
Let $L: \mathbb{R}^n \to \mathbb{R}^m$. The **matrix of $L$ with respect to the standard basis** (which we will write $M_L$) is an array of numbers with $m$ rows and $n$ columns. The $j^{th}$ column is the output of the linear transformation when the input is $\vec{e}_j$.
$$

M_L =

\begin{bmatrix}

\vert & \vert & \vert & \dots & \vert\\

L(\vec{e}_1) & L(\vec{e}_2) & L(\vec{e}_3) & ... & L(\vec{e}_n)\\

\vert & \vert & \vert & \dots & \vert

\end{bmatrix}

=

\begin{bmatrix}

M_{1,1} & M_{1,2} & M_{1,3} & \dots & M_{1,n}\\

M_{2,1} & M_{2,2} & M_{2,3} & \dots & M_{2,n}\\

& & & \vdots & \\

M_{m,1} & M_{m,2} & M_{m,3} & \dots & M_{m,n}\\

\end{bmatrix}

$$

Note the convention that we are introducing here: the entry of the matrix $M_{i,j}$ is in the $i^{th}$ row and $j^{th}$ column.
  
**Example**: The linear transformation we introduced in the exercise had
$$
\begin{align*}

L\left( \begin{bmatrix} 1 \\ 0 \end{bmatrix}\right) &= \begin{bmatrix} 1 \\ 2 \\ 3 \end{bmatrix}\\

L\left( \begin{bmatrix} 0 \\ 1 \end{bmatrix}\right) &= \begin{bmatrix} 1 \\ -1 \\ 1 \end{bmatrix}\\

\end{align*}
$$

So the matrix would be
$$
M_L = \begin{bmatrix}1 & 1\\ 2 & -1 \\ 3 & 1 \end{bmatrix}
$$

For an example of indexing conventions: $M_{1,2} = 1$ and $M_{2,1} = 2$ 
# Matrix
**Three Perspectives** on matrix-vector products:
Consider the matrix vector product
$$
\begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6\end{bmatrix} \begin{bmatrix} 7 \\ 8 \\ 9\end{bmatrix}
$$
We can think of this three different ways:
1. We can think of it as a linear trasformation $L : \mathbb{R}^3 \to \mathbb{R}^2$ being applied to a vector in $\mathbb{R}^3$. From this perspective, the matrix is taking 3D space and "smashing it" onto 2D space in such a way that parallelograms always get mapped to paralelleograms. The one vector we are plugging in is just coming along for the ride.
2. We can think of it as a linear combination of the columns of the matrix:
$$
\begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6\end{bmatrix} \begin{bmatrix} 7 \\ 8 \\ 9\end{bmatrix} = 7 \begin{bmatrix}1 \\ 4 \end{bmatrix} + 8 \begin{bmatrix} 2 \\ 5\end{bmatrix} + 9 \begin{bmatrix} 3 \\ 6 \end{bmatrix}
$$
from this perspective the matrix is just a list of column vectors, and a matrix-vector product is a recipe for giving a desired linear combination of the columns vectors.
3. We can think of it as dotting the rows of the matrix with the vector:
$$
\begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6\end{bmatrix} \begin{bmatrix} 7 \\ 8 \\ 9\end{bmatrix} = \begin{bmatrix} 1(7) + 2(8) + 3(9) \\ 4(7) + 5(8) + 6(9)\end{bmatrix}
$$
This is a little harder to interpret, but is an especially useful perspective when $M \vec{v} = 0$: it says that the rows of $M$ are all perpendicular to the vector $\vec{v}$.
We define matrix multiplication so that it corresponds to composition of the associated linear maps:
**Definition**: Let $A$ be an $n \times m$ matrix and $B$ be an $k \times n$ matrix. Then we have associated linear maps $L_A: \mathbb{R}^m \to \mathbb{R}^n$ and $L_B: \mathbb{R}^n \to \mathbb{R}^k$. We define the matrix product $BA$ to be the matrix of the linear map $L_B \circ L_A: \mathbb{R}^m \to \mathbb{R}^n$.
In other words, if $A$ has columns $\vec{c}_1, \vec{c}_2, \vec{c}_3, \dots, \vec{c}_m \in \mathbb{R}^n$, so that
$$
A =

\begin{bmatrix}

\vert & \vert & \vert & \dots & \vert\\

\vec{c}_1 & \vec{c}_2 & \vec{c}_3 & \dots & \vec{c}_m \\

\vert & \vert & \vert & \dots & \vert

\end{bmatrix}
$$
then
$$
BA =

\begin{bmatrix}

\vert & \vert & \vert & \dots & \vert\\

B\vec{c}_1 & B\vec{c}_2 & B\vec{c}_3 & \dots & B\vec{c}_m \\

\vert & \vert & \vert & \dots & \vert

\end{bmatrix}
$$
 If $B$ has rows $\vec{r}_1, \vec{r}_2, \vec{r}_3, \dots \vec{r}_n$, so that
$$
B =

\begin{bmatrix}

\rule[.5ex]{3.5em}{0.4pt} & \vec{r}_1 & \rule[.5ex]{3.5em}{0.4pt}\\

\rule[.5ex]{3.5em}{0.4pt} & \vec{r}_2 & \rule[.5ex]{3.5em}{0.4pt}\\

\rule[.5ex]{3.5em}{0.4pt} & \vec{r}_3 & \rule[.5ex]{3.5em}{0.4pt}\\

\rule[.5ex]{3.5em}{0.4pt} & \vdots & \rule[.5ex]{3.5em}{0.4pt}\\

\rule[.5ex]{3.5em}{0.4pt} & \vec{r}_n & \rule[.5ex]{3.5em}{0.4pt}\\

\end{bmatrix}

$$
then we have
$$
BA = \begin{bmatrix}

\vec{r}_1 \cdot \vec{c}_1 & \vec{r}_1 \cdot \vec{c}_2 & \vec{r}_1 \cdot \vec{c}_3 & \dots & \vec{r}_1 \cdot \vec{c}_m\\

\vec{r}_2 \cdot \vec{c}_1 & \vec{r}_2 \cdot \vec{c}_2 & \vec{r}_2 \cdot \vec{c}_3 & \dots & \vec{r}_2 \cdot \vec{c}_m\\

\vec{r}_3 \cdot \vec{c}_1 & \vec{r}_3 \cdot \vec{c}_2 & \vec{r}_3 \cdot \vec{c}_3 & \dots & \vec{r}_3 \cdot \vec{c}_m\\

\vdots & \vdots & \vdots & \vdots & \vdots\\

\vec{r}_n \cdot \vec{c}_1 & \vec{r}_n \cdot \vec{c}_2 & \vec{r}_n \cdot \vec{c}_3 & \dots & \vec{r}_n \cdot \vec{c}_m\\

\end{bmatrix}
$$
# Matrix x Vector
A matrix (a list of lists) can be dotted with a vector (a list) only if the number of columns in the matrix equals the length of the vector. For example, an n x m matrix requires a vector of length m.
```python
def matrix_dot_vector(a: list[list[int|float]], b: list[int|float]) -> list[int|float]:
    if len(a[0]) != len(b):
        return -1
    result = []
    for row in a:
        total = 0
        for i in range(len(row)):
            total += row[i] * b[i]
        result.append(total)
    return result
```
# Matrix Transpose

```python
def transpose_matrix(a: list[list[int|float]]) -> list[list[int|float]]:
    return [list(i) for i in zip(*a)]
```
The `zip(*a)`unpack the elements in the list `a` 
