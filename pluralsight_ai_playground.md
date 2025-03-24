# AI Prompt Sandbox helper for Pluralsight 

- AI Provider Model	HTTPS Endpoint (https://app.pluralsight.com/hands-on/playground/prompt-documentation)
- Azure ChatGPT 4o	        https://labs-ai-proxy.acloud.guru/rest/openai/chatgpt-4o/v1/chat/completions
- Anthropic Claude          Instant v1	https://labs-ai-proxy.acloud.guru/rest/bedrock/anthropic/claude-instant-v1
- Anthropic Claude - v2	    https://labs-ai-proxy.acloud.guru/rest/rest/bedrock/anthropic/claude-v2
- Amazon Titan TG1 Large	  https://labs-ai-proxy.acloud.guru/bedrock-amazon/titan-tg1-large
- Ai21 Jamba Mini	          https://labs-ai-proxy.acloud.guru/rest/bedrock/ai21/jamba-mini
- Ai21 Jamba Large	        https://labs-ai-proxy.acloud.guru/rest/bedrock/ai21/jamba-large
- Meta Llama 3 - v1	        https://labs-ai-proxy.acloud.guru/rest/bedrock/meta/llama2-13b-chat-v1

# OpenAI 
```
curl -X POST \
  -H "Authorization: Bearer 3955bda8-xxxx" \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Hello chatbot"}' \
  https://labs-ai-proxy.acloud.guru/rest/openai/chatgpt-4o/v1/chat/completions
```
LangChain with AI Playground
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
### AWS AI Playground
**AWS Bedrock** has access to multiple models to play with. 
