#!/bin/bash

sudo apt install docker.io
sudo apt install docker-compose
sudo systemctl enable docker
sudo gpasswd -a ${USER} docker


sudo snap install microk8s --classic
sudo usermod -a -G microk8s ${USER}

alias kubectl="microk8s kubectl"
microk8s enable dns ingress  storage
microk8s kubectl create configmap nginxconfigmap --from-file=default.conf
microk8s kubectl apply -f mysql-pv.yaml
microk8s kubectl apply -f mysql-deployment.yaml
microk8s kubectl apply -f nginxsecrets.yaml
microk8s kubectl apply -f deployment.yaml
microk8s kubectl apply -f Ingress.yaml

microk8s kubectl get nodes
microk8s kubectl get pods
microk8s kubectl get services
microk8s kubectl get ingress

curl -k https://kubernetes.project.dev


