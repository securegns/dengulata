# Ollama
- Install Ollama on linux - ```curl -fsSL https://ollama.com/install.sh | sh```
- List all the models in Ollama library -     ```curl -s https://ollama.com/library | grep -oP 'href="/library/\K[^"]+'```
- List the local models - ```ollama list```
- Download a model - ```ollama pull llama3```
- Delete a model - ```ollama rm llama3```

### Curl command to interact with ollama
```
curl -X POST http://localhost:11434/api/chat -d '{"model": "qwen2.5-coder", "messages": [{"role": "user", "content": "Hello, how can you assist me today in only one short sentence?"}], "stream": false}'
```

### Python program to do the same thing but with arguments 
```
import sys
import requests
import json

# Check if the correct number of arguments is provided
if len(sys.argv) != 4:
    print("Usage: python script.py <url> <model> <prompt>")
    print("Example: python ollama_chat.py http://localhost:11434/api/chat qwen2.5-coder "Hello, how can you assist me today in only one short sentence?"")
    sys.exit(1)

# Get arguments from sys.argv
url = sys.argv[1]  # e.g., http://localhost:11434/api/chat
model = sys.argv[2]  # e.g., gemma3
prompt = sys.argv[3]  # e.g., Hello, how can you assist me today?

# Prepare the JSON payload
payload = {
    "model": model,
    "messages": [{"role": "user", "content": prompt}],
    "stream": False
}

try:
    # Make the POST request
    response = requests.post(url, json=payload)
    response.raise_for_status()  # Raise an error for bad HTTP status codes

    # Parse the JSON response
    data = response.json()

    # Extract and print only the 'content' from the 'message' field
    content = data.get("message", {}).get("content", "No content found")
    print(content)

except requests.exceptions.RequestException as e:
    print(f"Error making request: {e}")
except json.JSONDecodeError:
    print("Error: Invalid JSON response from server")
except KeyError:
    print("Error: 'content' not found in response")

```
