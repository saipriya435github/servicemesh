#!/bin/bash

# Update the package list and install required packages
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add the Docker repository key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Remove the Docker repository key from the old trusted.gpg keyring
sudo apt-key --keyring /etc/apt/trusted.gpg del 0EBFCD88

# Add the Kubernetes repository key and repository
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package list again to get the new repositories
sudo apt-get update

# Install Docker and Kubernetes
sudo apt-get install -y docker-ce kubelet kubeadm kubectl

