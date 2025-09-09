---
tags:
  - LLM
  - AI
  - ML
  - MLE
link: https://www.coursera.org/learn/retrieval-augmented-generation-rag/
---
# RAG OVERVIEW 
Why RAG?
##  LLM problems
- No source / private databases
- Hard to access information
- out-of-date
- how to solve?
	- just put it in the prompt!
## Retriver
- manages knowledge base of trusted information
- finds the most relevant information and shares information with the LLM
- improve generation
- 
## RAG architecture
![[Screenshot 2025-08-13 at 11.10.42 AM.png]]

## Advantage of RAG
- inject missing knowledge
	- adds info not in the training data
		- e.g., policies, updates
- reduces hallucinations
	- grounds answer with relevant context
- keeps models up to date
	- reflects new info by updating the knowledge base
- enables source citation
	- includes sources for verifiable answers
- focuses model on generation
	- retrievers finds facts, LLM write responses
## LLM
### Token
- a piece of a word
- some words get single tokens
- compound words use multiple tokens
- punctuation marks
- ~10,000 - 100,000 tokens in LLM's vocabulary, allowing models to represent any possible word with fewer tokens
### Autoregressive
- "self-influencing"
- new tokens make sense in context of old ones
- running in same prompt leads to different completion
### Why LLM hallucinate?
- LLM generate probable word sequences: LLM just reproduce statistical patterns from their training data
- knowledge gaps cause inaccurate responses: responses can "sound right" but aren't true
- Truthful != probable: LLM are designed to generate "probable" text, not truthful text
### Why not add everything?
#### higher computational cost
- longer prompts take more computation to run
- model performs computationally complex scan of every token
- scan happens before generating each new token
#### Context window limit
- eventually you hit the limit of LLM's context window
- smaller models: only a few thousand tokens
- largest models: millions
## Retriever tradeoffs
- relevance vs irrelevence
- return every document?
	- waste context window
- return the single highest ranked document?
	- miss valuable information
- no perfect solution
- monitor and experiment
	- change settings to find what works
## Practical implementation 
- relational database
- vector database
	- specialized for retrieval in a RAG system
## Key concept
- RAG pairs an LLM with a knowledge base
- Data is private, recent, or highly specific and so missing from the LLM's training data
- Retriever finds relevant documents and adds them to an augmented prompt
- LLM ground their responses in the retrieved information

# Information Retrieval and Search Foundations
## Search Approaches
### **Keyword search**
- look for documents containing the **exact words** found in the prompt
- ensures sensitivity to exact words the user included in the prompt
- Bag of words
	- word order is ignored, only word presence and frequency matter
- sparse vectors (a word vector)
	- each doc will have a sparse vector - i.e., inverted index
		- started from a word in the prompt and find every document contains it
		- then same process for every other keyword in the prompt
		- if a doc contains a keyword it scores a point
		- total score can be used to rank the doc
		- doc with highest scores are retrieved
	- Frequency based scoring
		- for keywords that appear more than 1 time, score each time appearance in the doc an additional point
	- normalized TF scoring
		- longer documents may contain keywords many times simply bc they are longer
		- solution: **normalize by document length**
		- `Score = number of keyword occurrences / total words in doc`
	- **TF-IDF** 
		- another thing: basic TF scoring treat all words equally , whether they are common filler words ("a", "the", etc) or rare, meaningful terms
		- Solution: weight terms using "inverse document frequency" (IDF)
		- `Score = TF(word, doc) x log(Total docs / Docs containing word)`
		- 
### **Semantic Search**
- looks for documents with similar meaning to the prompt
- finds documents with similar meaning, even without matching words
### **Metadata Filter**
- each search approaches returns 20-50 docs
- go through metadata filter
- excludes documents based on rigid criteria
	- like a SQL query 
- PRO
	- simple to understand and debug
	- fast, optimized, mature and reliable
	- enforces strict retrieval rulse, matching exact filter criteria
- CONS
	- not true search
	- rigid, ignores content, and provides no way for ranking
	- useless alone
## Hybrid search
- using multiple search approaches
- combined document ranking lists from the search and after metadata filter, then set along with the prompt for augmented prompt
- high-performing retrievers balance all three techniques based on project needs







# Resources
- LangChain: https://docs.langchain.com.cn/docs/introduction/
- RAG 常用开源框架： https://juejin.cn/post/7517852468119519286
- 
