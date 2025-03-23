# Dengulata
LLM/SLM helper codes and notes

### Services to get LLM models
1. Ollama
2. Huggingface

## Interesting models to try
1. Phi3.5         - Tiny model that can be run on CPU
2. LLama3.2     - LLama model can be run on CPU

## Important practical topics
1. Langchain [FreeCodeCamp Langchain](https://www.youtube.com/watch?v=lG7Uxts9SXs)
2. Claude MCP
3. 

## Important services
1. MCP                   -  n8n(codeless), Langchain or OpenAI Agents SDK
2. Voice                 -  ElevenLabs, Whisper(Speach to text), xtts2 or Openvoice(Text-to-Speech)
3. Browser Automation    -  RooCode, browser-use
4. AI Agent (Browser, coding) - RooCode
5. Internet access       -  DuckDuckGo,
6. Coding                -  Cursor, [windsurf](https://codeium.com/windsurf)

## Important theory topics 
1. MCP - Model Context Protocol, AI Agents
2. Memory
    -    Re-training/Fine tuning
    -    RAG - Retrieval-augmented generation
    -    Context Docs
3. AI Workflows
    -    Prompt chaining
    -    Parllelization
    -    Orchestrator-Worker
    -    Evaluator-Optimizer
    -    Routing

## Useful commands
- List all the fies and their content and save it in a text file ```find . -type f -exec sh -c 'echo "---Filename: {}---"; cat {}; echo "-------"' \; > files_with_content.txt```
- Docker webui for ollama ```docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 -p 80:8080 --name open-webui --restart always ghcr.io/open-webui/open-webui:main```
- Curl command to talk to DeepSeek API using OpenRouter APIs
  ```
  curl https://openrouter.ai/api/v1/chat/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer sk-or-v1-979c08eebcd708a3da63251099fdbddba75f80690299d25f9d3aexxxxxxx" \
      -d '{
      "model": "deepseek/deepseek-r1:free",
      "messages": [
        {
          "role": "user",
          "content": "What is the meaning of life?"
        }
      ]
      
    }'
  ```
- Curl command to for free Gemeni api key
  ```
  curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=YOUR_API_KEY" \
      -H 'Content-Type: application/json' \
      -X POST \
      -d '{
        "contents": [
          {
            "parts": [
              {
                "text": "Explain how AI works in a few words"
              }
            ]
          }
        ]
      }'
  ```
