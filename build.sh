#!/bin/bash

export http_proxy=http://192.168.168.1:8080 
export https_proxy=http://192.168.168.1:8080
export NO_PROXY=localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24

echo "##########################"

minikube delete --all
minikube start

alias kubectl="minikube kubectl --"
echo "##########################"
minikube kubectl -- create configmap nginxconfigmap --from-file=default.conf
echo "##########################"
minikube kubectl -- apply -f mysql-pv.yaml
echo "##########################"
minikube kubectl -- apply -f mysql-deployment.yaml
echo "##########################"
minikube kubectl -- apply -f nginxsecrets.yaml
echo "##########################"
minikube kubectl -- apply -f deployment.yaml
echo "##########################"
minikube kubectl -- apply -f Ingress.yaml
echo "##########################"
minikube kubectl -- get nodes
echo "##########################"
minikube kubectl -- get pods
echo "##########################"
minikube kubectl -- get services
echo "##########################"
minikube kubectl -- get ingress
echo "##########################"
minikube kubectl -- get events

#curl -k https://kubernetes.project.dev

#minikube delete --all

