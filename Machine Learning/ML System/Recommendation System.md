---
tags:
  - ML
  - MLE
  - system_design
---

Reference: 
basic: https://www.youtube.com/watch?v=gEdePRsDACc&ab_channel=IBMTechnology
Spotify: https://www.youtube.com/watch?v=pGntmcy_HX8&ab_channel=TheWallStreetJournal
project example: 
- Book recommendation - https://www.youtube.com/watch?v=x-alwfgQ-cY&ab_channel=Dataquest
- 
# Data Gathering
### Explicit data (overt user action)
- comment
- reviews
- rating
### Implicit data (latent user behavior)
- click
- past purchases
- search history
# Data Storing
- PII data: Personally Identifiable Information
	- sensitive
	- direct info: person's name, Social Security number, and email address, etc
	- indirect info: gender, race, and birth date, etc
	- handling PII:
		- categorize use into age group instead of exact age to reduce PII risk
		- covering location coordinate to city or state for less precision
# Analysis
- Data normalization
	- relatively click #: click # of recommendation / recommendation number or total click
- detect patterns, correlations
- weight the strength of the patterns
# Filtering
## Collaborative filtering
- Assumes 
	- people with comparable preferences are likely interested in similar content
	- likely interact with the content in similar ways in future
- Two types
	- Memory based
		- represent users and items as matrix
			- e.g., KNN algorithm to find the nearest neighbors (similar users/items)
		- item based
			- e.g., identify which music are put in the same playlist together very often
		- user based
	- Model based
		- predict use preferences by identifying patterns in user behavior
			- e.g, matrix factorization
## Content-based filtering
- filter content based on content features
	- metadata
	- keyword
- useful for new and niche item
- compatibility score
	- quantified way to the content: higher means more likely to be similar/to be interested
## Hybrid filtering
- combining the two filtering methods
# Feedback loop
- algorithm 
	- batch-based
		- good to start with
	- in real-time

- Training frequency
	- as data flow in
- Evaluation / test accuracy
	- Metrics
		- click
		- average listening/watching time
	- long-term 
		- monitoring metric for 7-days / 14-days churn
	- Segmentation evaluation
		- by demographic data
		- e.g., new users vs long-term users: old users maybe more tied to the current model
		- e.g., feature consider follower-to-follower ratio of the
- regression and update
	- set up benchmark beforehand
		- design different models, parallel testing for primary model and alternatives to quickly respond to performance regression
	- check for sign of overfitting during retraining as indicator of when to refresh the model
	- 
