#!/bin/bash

# Exit on error
set -e

echo "Starting VS Code Server setup..."

# Update system
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install required packages
echo "Installing required packages..."
sudo apt-get install -y curl wget nginx

# Install code-server
echo "Installing code-server..."
curl -fsSL https://code-server.dev/install.sh | sh

# Create code-server config directory
echo "Configuring code-server..."
mkdir -p ~/.config/code-server

# Create code-server config
cat > ~/.config/code-server/config.yaml << EOL
bind-addr: 0.0.0.0:8080
auth: password
password: vscode123
cert: false
EOL

# Configure NGINX
echo "Configuring NGINX..."
sudo tee /etc/nginx/sites-available/code-server.conf << EOL
server {
    listen 80;
    listen [::]:80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_http_version 1.1;
        proxy_redirect off;
        proxy_read_timeout 86400;
    }
}
EOL

# Enable the NGINX site
sudo ln -sf /etc/nginx/sites-available/code-server.conf /etc/nginx/sites-enabled/code-server.conf
sudo rm -f /etc/nginx/sites-enabled/default

# Test NGINX config
echo "Testing NGINX configuration..."
sudo nginx -t

# Start and enable services
echo "Starting services..."
sudo systemctl enable --now code-server@$USER
sudo systemctl enable nginx
sudo systemctl restart nginx

# Wait for services to start
sleep 2

# Check service status
echo -e "\nService Status:"
echo "----------------"
sudo systemctl status code-server@$USER --no-pager
echo -e "\n"
sudo systemctl status nginx --no-pager

# Print access information
echo -e "\n\nSetup Complete!"
echo "----------------"
echo "You can now access VS Code at: http://YOUR_SERVER_IP"
echo "Password: vscode123"
echo -e "\nTo change the password, edit: ~/.config/code-server/config.yaml"
echo "and restart the service with: sudo systemctl restart code-server@$USER" 
