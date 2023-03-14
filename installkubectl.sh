#!/bin/bash


#Download the latest release with the command:
curl -LO https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl

#Validate the binary (optional)
#Download the kubectl checksum file:
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"


#Validate the kubectl binary against the checksum file:
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check


#Install kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#Test to ensure the version you installed is up-to-date:
kubectl version --client --output=yaml


