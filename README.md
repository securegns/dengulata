# Dengulata
LLM/SLM helper codes and notes

### Services to get LLM models
1. Ollama
2. Huggingface

## Interesting models to try
1. Phi3.5         - Tiny model that can be run on CPU
2. LLama3.2     - LLama model can be run on CPU

## Index
1. Langchain [FreeCodeCamp Langchain](https://www.youtube.com/watch?v=lG7Uxts9SXs)
    - Program 1 - Using openai api and langchain
    - Program 2 - Using Pluralsight AI sandbox and langchain
2. OpenAI Agents

## Useful commands
- List all the fies and their content and save it in a text file ```find . -type f -exec sh -c 'echo "---Filename: {}---"; cat {}; echo "-------"' \; > files_with_content.txt```
- Docker webui for ollama ```docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 -p 80:8080 --name open-webui --restart always ghcr.io/open-webui/open-webui:main```
