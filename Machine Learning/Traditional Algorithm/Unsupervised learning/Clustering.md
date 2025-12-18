---
tags:
  - ML
  - MLE
  - unsupervised
  - clustering
  - k-means
---
# Clustering
- group similar data points together
- e.g, 
	- grouping similar news
	- DNA analysis
	- astronomical data analysis
# K-means algorithm
## Steps
1. assign each point to its closest centroid
2. recompute the centroids
3. repeat step 1&2
4. until the centroids don't move
## Algorithm
Randomly initialize $K$ cluster centroids $\mu_1,\mu_2,...,\mu_K$
Repeat {
	# Assign points to cluster centroids
	for i = 1 to m
		$c^{(i)}$ = index (from 1 to $K$) of cluster centroids closest to $x^{(i)}$
	# Move cluster centroids
	for k=1 to K
		$\mu_k$ = average (mean) of points assigned to cluster k
		}
- If a cluster have no points assigned, eliminate it.
## Optimization objective
$\mu_{c^{(i)}}$ = cluster centroid of cluster to which example $x^{(i)}$ has been assigned
### Distortion Cost function
![[Screenshot 2025-12-16 at 11.27.16 AM.png]]
## Initializing K-means
- Choose K < m
- Randomly pick K training examples
- Set $\mu_1,\mu_2,...,\mu_K$ equal to these K examples
- for i = 1 to 100   (i usually range between 50-1000) 
	{
	Randomly initialize K-means
	Run K-means, Get $c^{(1)},... c^{(m)},\mu_1,\mu_2,...,\mu_K$
	Compute Distortion cost function
	}
- Pick set of clusters that gave lowest cost
## Choosing the number of clusters
- Elbow method (not preferred)
- often you want to get clusters for some later (downstream) purpose
- evaluate k-means based on how well it performs on that later purpose

