# First Step Install on all the nodes
# Add the docker repository key. GPG uses a method of encryption known as public key (asymmetric) cryptography, which provides a number of advantages and benefits. 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add the docker repository
DISTRO=$(lsb_release -c -s)
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $DISTRO stable" | sudo tee /etc/apt/sources.list.d/docker.list

#Reload the apt sources list
sudo apt-get update

#Install docker community edition
sudo apt-get install -y docker-ce

#Prevent auto updates for docker package
sudo apt-mark hold docker-ce

#Add the kubernetes repository key.
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#Add the kubernetes repository
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-$DISTRO main
EOF

#Reload the apt sources list
sudo apt-get update

#Install packages
sudo apt-get install -y kubelet kubeadm kubectl

#Prevent auto updates for kube package
sudo apt-mark hold kubelet kubeadm kubectl
