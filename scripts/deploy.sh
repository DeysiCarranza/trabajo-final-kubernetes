#!/bin/bash

# Script de despliegue automático de la aplicación web en Kubernetes
# Aplica los manifiestos YAML y muestra el estado de los recursos creados.

echo "Desplegando aplicación..."

# Crear o actualizar el Deployment de Nginx
kubectl apply -f deployment/deployment-nginx.yaml

# Crear o actualizar el Service NodePort
kubectl apply -f deployment/service-nginx.yaml

# Mostrar información del Deployment
echo ""
echo "Estado del Deployment:"
kubectl get deployments

# Mostrar información de los Pods
echo ""
echo "Estado de los Pods:"
kubectl get pods

# Mostrar información de los Services
echo ""
echo "Estado de los Services:"
kubectl get services

# Fin del script
echo ""
echo "Despliegue finalizado."
