#!/bin/bash

# Update the apt package index
sudo apt update

# Install commonly used packages
sudo apt install -y \
    git \
    curl \
    wget \
    nano \
    unzip \
    jq \
    htop \
    net-tools \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    build-essential

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add current user to docker group
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Node.js (Optional, adjust version as needed)
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Install Python (Optional, adjust version as needed)
sudo apt install -y python3 python3-pip

# Install Java Development Kit (Optional, adjust version as needed)
sudo apt install -y default-jdk

# Install Go (Optional, adjust version as needed)
sudo apt install -y golang-go

# Install Kubernetes command-line tool (kubectl)
sudo snap install kubectl --classic

# Install VirtualBox (Optional, adjust version as needed)
# sudo apt install -y virtualbox

# Install Minikube (Optional, adjust version as needed)
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube /usr/local/bin/

# Clean up
rm get-docker.sh minikube

# Print versions
echo "Git version:"
git --version

echo "Docker version:"
docker --version

echo "Docker Compose version:"
docker-compose --version

echo "Node.js version:"
node --version

echo "Python version:"
python3 --version

echo "Java version:"
java -version

echo "Go version:"
go version

echo "kubectl version:"
kubectl version --client
