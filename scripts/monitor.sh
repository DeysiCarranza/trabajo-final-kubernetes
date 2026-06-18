#!/bin/bash

# Script de monitoreo básico para Kubernetes
# Muestra el estado general del clúster y de la aplicación.

echo "===== MONITOREO DEL CLUSTER ====="
echo ""

echo "Nodos:"
kubectl get nodes

echo ""
echo "Deployments:"
kubectl get deployments

echo ""
echo "Pods:"
kubectl get pods

echo ""
echo "Services:"
kubectl get services

echo ""
echo "Monitoreo finalizado."
