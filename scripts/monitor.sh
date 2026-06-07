#!/bin/bash

# Script de monitoreo básico para Kubernetes
# Muestra el estado general del clúster y de la aplicación.

echo "===== MONITOREO DEL CLUSTER ====="
echo ""

echo "Nodos:"
sudo kubectl get nodes

echo ""
echo "Deployments:"
sudo kubectl get deployments

echo ""
echo "Pods:"
sudo kubectl get pods

echo ""
echo "Services:"
sudo kubectl get services

echo ""
echo "Monitoreo finalizado."
