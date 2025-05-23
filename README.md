# Dengulata
LLM/SLM helper codes and notes

# ToDos
- Try Huggingface
- Try MCP with Ollama either OpenAI sdk or LangChain
- Try Claude MCP
- Try RAG with Langchain
- Try LangChain and LangGraph
- Create notes on running docker chatgpt like ui for chatting with all your APIs 
- LangChain chain of thoughts using Gemini
- ElevenLabs, Whisper(Speach to text), xtts2 or Openvoice(Text-to-Speech)
- Streamlet in py and gradio
- course
     - https://app.pluralsight.com/library/courses/introduction-developing-ai-agents/table-of-contents, https://github.com/huggingface/agents-course
     - [GenAI Essentials – Full Course for Beginners](https://www.youtube.com/watch?v=nJ25yl34Uqw)
     - [LLM Course – Build a Semantic Book Recommender (Python, OpenAI, LangChain, Gradio)](https://www.youtube.com/watch?v=Q7mS1VHm3Yw) | [code](https://github.com/t-redactyl/llm-semantic-book-recommender/tree/main)
     - [AI Engineer Roadmap – How to Learn AI in 2025](https://www.youtube.com/watch?v=nYXVvK-Wmn0)
     
### Services to work with LLM models
1. Ollama
2. Huggingface
3. AI Cloud serivces    -    Microsoft AI Foundary (Azure), AWS Bedrock
    - [AI Agents in Azure](https://devblogs.microsoft.com/all-things-azure/how-to-develop-ai-apps-and-agents-in-azure-a-visual-guide)
## Interesting models to try
1. Phi3.5       - Tiny model that can be run on CPU
2. LLama3.2     - LLama model can be run on CPU
3. gpt-4o-mini  - Cheapest API
4. gemini-2.0-flash - Offers free API

## Important practical work
1. LangChain and LangGraph
2. Claude MCP
3. [Awesome-MCP-Servers](https://github.com/punkpeye/awesome-mcp-servers) 

## Important services
1. MCP                   -  n8n(codeless), Langchain or OpenAI Agents SDK
2. Voice                 -  ElevenLabs, Whisper(Speach to text), xtts2 or Openvoice(Text-to-Speech)
3. Browser Automation    -  RooCode, browser-use
4. AI Agent (Browser, coding) - RooCode, [Screenpipe](https://github.com/mediar-ai/screenpipe)
5. Internet access       -  DuckDuckGo, tavily.com
6. Coding                -  Cursor, [windsurf](https://codeium.com/windsurf), Replit

## Important Links
- OpenAI Whisper TTS example - https://colab.research.google.com/github/fastforwardlabs/whisper-openai/blob/master/WhisperDemo.ipynb
- 
## Important theory topics 
1. MCP - Model Context Protocol, AI Agents
2. Memory
    -    Re-training/Fine tuning
    -    RAG - Retrieval-augmented Generation
    -    CAG - Cache-Augmented Generation
    -    Context Docs
3. AI Workflows
    -    Prompt chaining
    -    Parllelization
    -    Orchestrator-Worker
    -    Evaluator-Optimizer
    -    Routing

## Agents
course 
- https://app.pluralsight.com/library/courses/introduction-developing-ai-agents/table-of-contents
- https://github.com/huggingface/agents-course


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
- Curl command to for free Gemini api key
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
