# n8n
### docker commands
```
docker volume create n8n_data
```
```
docker run -it -d --rm --name n8n N8N_SECURE_COOKIE=false -d -p 80:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n
```

- Use llama3.2:1b model in ollama
