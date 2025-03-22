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

### Program 2 using Pluralsight AI sandboxes
```
import requests
from langchain.llms.base import LLM

class CustomLLM(LLM):
    @property
    def _llm_type(self) -> str:
        return "custom"

    def _call(self, prompt: str, stop=None) -> str:
        url = "https://labs-ai-proxy.acloud.guru/rest/openai/chatgpt-4o/v1/chat/completions"
        headers = {
            "Authorization": "Bearer f1664bfa-b33b-4ad6-97ec-ffcde6e20353",
            "Content-Type": "application/json"
        }
        data = requests.post(url, headers=headers, json={"prompt": prompt}).json()
        return data.get("message", {}).get("content") or data.get("response") or ""

if __name__ == "__main__":
    llm = CustomLLM()
    prompt = "Tell me one dog name and keep it one word response"
    response = llm.invoke(prompt)
    print(response)
```
###### v2 with arguments 
```
# python run.py "f1664bfa-b33b-4ad6-97ec-ffcde6e20353" "Tell me one dog name and keep it one word response"
import requests
from langchain.llms.base import LLM
import sys

class CustomLLM(LLM):
    @property
    def _llm_type(self) -> str:
        return "custom"

    def _call(self, prompt: str, stop=None, bearer_token: str = None) -> str:
        url = "https://labs-ai-proxy.acloud.guru/rest/openai/chatgpt-4o/v1/chat/completions"
        headers = {
            "Authorization": f"Bearer {bearer_token}",
            "Content-Type": "application/json"
        }
        response = requests.post(url, headers=headers, json={"prompt": prompt})
        data = response.json()
        return data.get("message", {}).get("content") or data.get("response") or ""

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python run.py <bearer_token> <prompt>")
        sys.exit(1)
    
    token = sys.argv[1]
    prompt = sys.argv[2]
    
    llm = CustomLLM()
    response = llm.invoke(prompt, bearer_token=token)
    print(response)
```
### program 3 with memory, a chatbot with memory with Ollama
```
import requests
from langchain.llms.base import LLM
from langchain_core.prompts import ChatPromptTemplate, MessagesPlaceholder
from langchain_core.runnables.history import RunnableWithMessageHistory
from langchain_community.chat_message_histories import ChatMessageHistory
from typing import Optional
import sys

class CustomLLM(LLM):
    bearer_token: str

    def __init__(self, bearer_token: str):
        super().__init__(bearer_token=bearer_token)
        self.bearer_token = bearer_token

    @property
    def _llm_type(self) -> str:
        return "custom"

    def _call(self, prompt: str, stop: Optional[list] = None) -> str:
        url = "https://labs-ai-proxy.acloud.guru/rest/openai/chatgpt-4o/v1/chat/completions"
        headers = {
            "Authorization": f"Bearer {self.bearer_token}",
            "Content-Type": "application/json"
        }
        # Use the custom endpoint's expected payload format
        response = requests.post(url, headers=headers, json={"prompt": prompt})
        
        # Debug and handle potential errors
        if not response.ok:
            print(f"API Error: {response.status_code} - {response.text}")
            return "Error: API request failed"
        
        try:
            data = response.json()
            return data.get("message", {}).get("content") or data.get("response") or "No response content"
        except requests.exceptions.JSONDecodeError:
            print(f"Invalid JSON response: {response.text}")
            return "Error: Invalid response format"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python run.py <bearer_token>")
        sys.exit(1)
    
    token = sys.argv[1]
    
    # Initialize the custom LLM
    llm = CustomLLM(bearer_token=token)
    
    # Define a prompt template
    prompt = ChatPromptTemplate.from_messages([
        ("system", "You are a helpful assistant who gives very short answers."),
        MessagesPlaceholder(variable_name="history"),
        ("human", "{input}")
    ])
    
    # Set up memory with ChatMessageHistory
    memory = ChatMessageHistory()
    
    # Create the runnable chain with message history
    chain = prompt | llm
    conversation = RunnableWithMessageHistory(
        chain,
        lambda: memory,
        input_messages_key="input",
        history_messages_key="history"
    )
    
    # Interactive chat loop
    print("Start chatting with the bot (type 'exit' to stop):")
    while True:
        user_input = input("You: ")
        if user_input.lower() == "exit":
            break
        response = conversation.invoke(
            {"input": user_input},
            config={"configurable": {"session_id": "default"}}
        )
        print(f"Bot: {response}")
```
