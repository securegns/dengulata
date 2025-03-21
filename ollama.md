# Ollama
- List all the models in Ollama -     ```curl -s https://ollama.com/library | grep -oP 'href="/library/\K[^"]+'```

```
curl http://localhost:11434/api/chat -d '{
  "model": "llama3",
  "messages": [
    {
      "role": "user",
      "content": "Hello, how can you assist me today?"
    }
  ],
  "stream": false
}'
```
