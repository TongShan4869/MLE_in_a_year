---
tags:
  - LLM
  - prompt
  - AI
  - MLE
link: https://learn.deeplearning.ai/courses/chatgpt-prompt-eng
---
# Two types of LLMs
- **base LLM**:
	- predict net word, based on text training data
- **Instruction tuned LLM**: 
	- tries to follow instructions
	- fine-tune on instructions and good attempts at following those instructions
	- RLHF reinforcement learning with human feedback
	- Helpful, honest, harmless

# Principle 1: **Write clear and specific instructions**

```python
client = openai.OpenAI()

def get_completion(prompt, model="gpt-3.5-turbo"):
    messages = [{"role": "user", "content": prompt}]
    response = client.chat.completions.create(
        model=model,
        messages=messages,
        temperature=0
    )
    return response.choices[0].message.content
```

## Tactic 1: Use delimiters to clearly indicate distinct parts of the input
- Delimiters can be anything like: \`\`\`,  """, < >, \<tag> \</tag> , :
## Tactic 2: Ask for a structured output
- JSON, HTML
## Tactic 3: Ask the model to check whether conditions are satisfied
- Check assumptions required to do the task
- E.g,
```python
text_1 = f"""
Making a cup of tea is easy! First, you need to get some \ 
water boiling. While that's happening, \ 
grab a cup and put a tea bag in it. Once the water is \ 
hot enough, just pour it over the tea bag. \ 
Let it sit for a bit so the tea can steep. After a \ 
few minutes, take out the tea bag. If you \ 
like, you can add some sugar or milk to taste. \ 
And that's it! You've got yourself a delicious \ 
cup of tea to enjoy.
"""
prompt = f"""
You will be provided with text delimited by triple quotes. 
If it contains a sequence of instructions, \ 
re-write those instructions in the following format:

Step 1 - ...
Step 2 - …
…
Step N - …

If the text does not contain a sequence of instructions, \ 
then simply write \"No steps provided.\"

\"\"\"{text_1}\"\"\"
"""
response = get_completion(prompt)
print("Completion for Text 1:")
print(response)
```
## Tactic 4: "Few-shot" prompting
- give successful examples of completing tasks

# Principle 2: Give the model time to “think” 
## Tactic 1: Specify the steps required to complete a task
- e.g.
```python
text = f"""
In a charming village, siblings Jack and Jill set out on \ 
a quest to fetch water from a hilltop \ 
well. As they climbed, singing joyfully, misfortune \ 
struck—Jack tripped on a stone and tumbled \ 
down the hill, with Jill following suit. \ 
Though slightly battered, the pair returned home to \ 
comforting embraces. Despite the mishap, \ 
their adventurous spirits remained undimmed, and they \ 
continued exploring with delight.
"""
# example 1
prompt_1 = f"""
Perform the following actions: 
1 - Summarize the following text delimited by triple \
backticks with 1 sentence.
2 - Translate the summary into French.
3 - List each name in the French summary.
4 - Output a json object that contains the following \
keys: french_summary, num_names.

Separate your answers with line breaks.

Text:
```{text}```"""
response = get_completion(prompt_1)
print("Completion for prompt 1:")
print(response)
```
- Ask for output in a specified format
## Tactic 2: Instruct the model to work out its own solution before rushing to a conclusion
e.g.
> """
> Your task is to determine if the student's solution \
> is correct or not.
> To solve the problem do the following:
> - First, work out your own solution to the problem including the final total. 
> - Then compare your solution to the student's solution \ 
> and evaluate if the student's solution is correct or not. 
> Don't decide if the student's solution is correct until 
> you have done the problem yourself.
> """

# Model limitations: Hallucinations
- first find relevant information
- then answer the question based on the relevant information
- -> [Retrieval Augmented Generation (RAG)](Retrieval%20Augmented%20Generation%20(RAG).md)

# Iterative Prompt Development
## Prompt guidelines
- be clear and specific
- analyze why result does not give desired output
- refine the idea and the prompt
- repeat
## Example issues
- Too long: Limit the number of words/sentences/characters.
	- "Use at most 50 words."
- Wrong details: Ask it to focus on the aspects that are relevant to the intended audience.
	- "The description is intended for furniture retailers, so should be technical in nature and focus on the materials the product is constructed from."
- Description needs a table of dimensions: Ask it to extract information and organize it in a table.
	- "Format everything as HTML that can be used in a website. Place the description in a \<div> element."

> thoughts: how to evaluate what is a good prompt???

# Use case: Summarizing
- Summarize with focus
	- price, value
	- shipping, delivery
- Try "extract" instead of "summarize"

# Use case: Inferring
- Sentiment (positive / negative)
	- "What is the sentiment of the following product review, which is delimited with triple backticks?"
	- "Give your answer as a single word, either "positive" or "negative"
- Identify types of emotions
	- "Identify a list of emotions that the writer of the following review is expressing. Include no more than five items in the list. Format your answer as a list of lower-case words separated by commas."
- Doing multiple tasks at once
	- "Identify the following items from the review text: 
		-Sentiment (positive or negative)
		-Is the reviewer expressing anger? (true or false)
		-Item purchased by reviewer
		-Company that made the item"
- Make a news alert for certain topics
```python
prompt = f"""
Determine whether each item in the following list of \
topics is a topic in the text below, which
is delimited with triple backticks.

Give your answer as follows:
item from the list: 0 or 1

List of topics: {", ".join(topic_list)}

Text sample: '''{story}'''
"""
response = get_completion(prompt)
print(response)
```
```python
topic_dict = {i.split(': ')[0]: int(i.split(': ')[1]) for i in response.split(sep='\n')}
if topic_dict['nasa'] == 1:
    print("ALERT: New NASA story!")
```

# Use case: Transforming
- Translation
- Tone transformation
- Format conversion
	- e.g., JSON to HTML
- Spellcheck / Grammar check
	-  'proofread' or 'proofread and correct'.
	- "Proofread and correct the following text and rewrite the corrected version. If you don't find and errors, just say "No errors found". Don't use  any punctuation around the text:"

> [!tip]
>  Can use `relines.Redlines` to show the diff

# Use case: Expanding
- Customize the automated reply to a customer email
	- based on _Sentiment_
		- if positive, thank the customer
		- if negative, apologize first
- Temperature
	- degree of aspiration or randomness of the LLM responses

# Use case: Chatbot
```python
def get_completion_from_messages(messages, model="gpt-3.5-turbo", temperature=0):
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=temperature, # this is the degree of randomness of the model's output
    )
#     print(str(response.choices[0].message))
    return response.choices[0].message["content"]
```
- Set `messages`
```python
messages =  [  
{'role':'system', 'content':'You are an assistant that speaks like Shakespeare.'},    
{'role':'user', 'content':'tell me a joke'},   
{'role':'assistant', 'content':'Why did the chicken cross the road'},   
{'role':'user', 'content':'I don\'t know'}  ]
```
- `system`: Sets behavior of assistant
- `assistant`: Chat model
- `user`: you

## OrderBot
### Create function to collect messages
```python
def collect_messages(_):
    prompt = inp.value_input
    inp.value = ''
    context.append({'role':'user', 'content':f"{prompt}"})
    response = get_completion_from_messages(context) 
    context.append({'role':'assistant', 'content':f"{response}"})
    panels.append(
        pn.Row('User:', pn.pane.Markdown(prompt, width=600)))
    panels.append(
        pn.Row('Assistant:', pn.pane.Markdown(response, width=600, style={'background-color': '#F6F6F6'})))
 
    return pn.Column(*panels)

```
### Create GUI using `panel`
```python
import panel as pn  # GUI
pn.extension()

panels = [] # collect display 

context = [ {'role':'system', 'content':"""
You are OrderBot, an automated service to collect orders for a pizza restaurant. \
You first greet the customer, then collects the order, \
and then asks if it's a pickup or delivery. \
You wait to collect the entire order, then summarize it and check for a final \
time if the customer wants to add anything else. \
If it's a delivery, you ask for an address. \
Finally you collect the payment.\
Make sure to clarify all options, extras and sizes to uniquely \
identify the item from the menu.\
You respond in a short, very conversational friendly style. \
The menu includes \
pepperoni pizza  12.95, 10.00, 7.00 \
cheese pizza   10.95, 9.25, 6.50 \
eggplant pizza   11.95, 9.75, 6.75 \
fries 4.50, 3.50 \
greek salad 7.25 \
Toppings: \
extra cheese 2.00, \
mushrooms 1.50 \
sausage 3.00 \
canadian bacon 3.50 \
AI sauce 1.50 \
peppers 1.00 \
Drinks: \
coke 3.00, 2.00, 1.00 \
sprite 3.00, 2.00, 1.00 \
bottled water 5.00 \
"""} ]  # accumulate messages


inp = pn.widgets.TextInput(value="Hi", placeholder='Enter text here…')
button_conversation = pn.widgets.Button(name="Chat!")

interactive_conversation = pn.bind(collect_messages, button_conversation)

dashboard = pn.Column(
    inp,
    pn.Row(button_conversation),
    pn.panel(interactive_conversation, loading_indicator=True, height=300),
)

dashboard
```
