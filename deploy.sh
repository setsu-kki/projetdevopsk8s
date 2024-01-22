#!/bin/bash

# Installation de K3s (s'il n'est pas déjà installé)
curl -sfL https://get.k3s.io | sh -

# Attendre que K3s soit prêt (cela peut prendre quelques instants)
sleep 10

# Appliquer le déploiement de la base de données (MySQL)
sudo k3s kubectl apply -f bdd-deployment.yaml

# Appliquer le déploiement de l'application (nginx) et du service LoadBalancer
sudo k3s kubectl apply -f nginx-deployment.yaml

# Attendre que les pods de la base de données soient prêts
echo "En attente que les pods de la base de données soient prêts..."
while [ "$(sudo k3s kubectl get pods -n projetdevopsk8s -o jsonpath='{.items[0].status.conditions[?(@.type=="Ready")].status}')" != "True" ]; do
    sleep 2
done

# Attendre que les pods de l'application soient prêts
echo "En attente que les pods de l'application soient prêts..."
while [ "$(sudo k3s kubectl get pods -n projetdevopsk8s -o jsonpath='{.items[0].status.conditions[?(@.type=="Ready")].status}')" != "True" ]; do
    sleep 2
done

# Récupérer l'adresse IP du service LoadBalancer
LB_IP=$(sudo k3s kubectl get services nginx-service -n projetdevopsk8s -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Application déployée avec succès. Accédez à http://$LB_IP:83"