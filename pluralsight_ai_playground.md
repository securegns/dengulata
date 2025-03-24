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
### AWS AI Playground
**AWS Bedrock** has access to multiple models to play with. 
