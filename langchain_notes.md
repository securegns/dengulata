# langchain
Setup
```
apt install python3-venv
python3 -m venv venv
source ./venv/bin/activate
pip install langchain openai streamlit langchain-community langchain-openai

cat > .env
OPENAI_API_KEY=your_api_key_here
```

### Program 1 using OpenAI andLangchain
```
from dotenv import load_dotenv
from langchain_openai import OpenAI

load_dotenv()

llm = OpenAI(temperature=0.7)
prompt = "List one cool dog name, with no additional text."
response = llm.invoke(prompt)  # Updated from llm(prompt) to llm.invoke(prompt)
print(response)
```
### Program 2 PromptChaining with Ollama
```
from langchain_ollama import ChatOllama
from langchain_core.messages import HumanMessage, AIMessage

llm = ChatOllama(model="llama3.2:3b")
history = []
def invoke_with_history(prompt):
    history.append(HumanMessage(content=prompt))
    response = llm.invoke(history)
    history.append(AIMessage(content=response.content))
    return response.content
# Start the conversation
print("Starting conversation...")
print("Assistant:", invoke_with_history("Hi, who are you?")); print("\n\n")
print("Assistant:", invoke_with_history("Tell me about Albert Einstein.")); print("\n\n")
print("Assistant:", invoke_with_history("What was his most famous equation?")); print("\n\n")
print("Conversation ended.")

```

