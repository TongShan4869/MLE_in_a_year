---
tags:
  - LLM
  - transformer
  - DNN
  - ML
  - MLE
  - NLP
---
# Courses
- Stanford CS25: https://www.youtube.com/watch?v=P127jhj-8-Y&ab_channel=StanfordOnline
- Hugging face: https://huggingface.co/learn/llm-course/chapter1/1

# Attention is all you need
- give weight the relevance of word to each other
- 
- self-attention: 
# Architecture
![[Screenshot 2025-07-30 at 12.14.46 AM.png]]
## Tokenize word
- input text -> tokens ID (numbers)
## Embedding
- token -> multi-dimensional vector
- vector learn to encode the meaning and context of individual tokens in the input sequence
- word2vec
## Position encoding/embedding
- model process each token in parallel
- to preserve the information about word order
## Encoder
- multi-headed self-attention layer
	- multiple weights are learned in parallel
	- number of heads: 12-100 
	- each head will learn a different aspect of language
- fully-connected feed forward network
	- output of this layer: a vector of logits proportional to probability score of each token in the tokenizer dictionary
## Decoder
- multi-headed self-attention layer
- fully-connected feed forward network
## Softmax output
- normalized probability score for every single word in in the vocabulary
- one single token will have a score higher than the rest


