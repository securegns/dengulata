# n8n
### docker commands
```
docker volume create n8n_data
```
```
docker run -it --rm --name n8n -p 80:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n
```
