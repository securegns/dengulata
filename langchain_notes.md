# langchain
Setup
```
python3 -m venv venv
source ./venv/bin/activate
pip install langchain openai streamlit langchain-community langchain-openai

cat > .env
OPENAI_API_KEY=your_api_key_here
```

### Program 1 using OpenAI andLangchain
###### v1 with exceptions
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
        body = {"prompt": prompt}
        response = requests.post(url, headers=headers, json=body)
        if response.status_code != 200:
            raise Exception(f"Request failed: {response.status_code} - {response.text}")
        data = response.json()

        # Check both possible response formats.
        if "message" in data and "content" in data["message"]:
            return data["message"]["content"]
        elif "response" in data:
            return data["response"]
        else:
            raise Exception(f"Unexpected response format: {data}")

if __name__ == "__main__":
    llm = CustomLLM()
    prompt = "Tell me one dog name and keep it one word response"
    # Use the recommended invoke() method
    response = llm.invoke(prompt)
    print(response)
```
### v2 with no exceptions
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
### v3 with arguments 
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
