# 02 - Automatización del despliegue mediante manifiestos YAML y script Bash

## Objetivo

El objetivo de esta etapa fue automatizar el despliegue de la aplicación web en Kubernetes utilizando archivos de configuración declarativos y un script de ejecución, evitando la necesidad de ingresar manualmente todos los comandos cada vez que se desea realizar un despliegue.

## Creación de manifiestos YAML

Inicialmente la aplicación fue desplegada utilizando comandos directos de `kubectl`. Posteriormente, con el fin de mejorar la administración y reproducibilidad del entorno, se crearon manifiestos YAML para definir los recursos de Kubernetes.

Los archivos creados fueron:

* `deployment/deployment-nginx.yaml`: define el Deployment de la aplicación Nginx con tres réplicas.
* `deployment/service-nginx.yaml`: define un Service de tipo NodePort para exponer la aplicación dentro de la red.

El uso de manifiestos YAML permite almacenar la configuración de la infraestructura dentro del repositorio, facilitando la reutilización y el control de versiones.

## Desarrollo del script de automatización

Para simplificar el despliegue se desarrolló el script `scripts/deploy.sh`.

Este script automatiza las siguientes tareas:

1. Aplicar el manifiesto del Deployment.
2. Aplicar el manifiesto del Service.
3. Verificar el estado de los Deployments.
4. Verificar el estado de los Pods.
5. Verificar el estado de los Services.

De esta manera, el despliegue completo puede realizarse mediante la ejecución de un único comando:

```bash
./scripts/deploy.sh
```

## Validación del funcionamiento

Se ejecutó el script de automatización y se comprobó que Kubernetes aplicó correctamente los manifiestos definidos en los archivos YAML.

Posteriormente se verificó que:

* El Deployment se encontraba operativo.
* Las tres réplicas de la aplicación estaban en estado Running.
* El Service NodePort se encontraba disponible.
* Los recursos podían ser administrados utilizando únicamente los archivos almacenados en el repositorio.

## Resultados obtenidos

Durante esta etapa se logró:

* Implementar infraestructura declarativa mediante archivos YAML.
* Automatizar el despliegue de la aplicación.
* Reducir la cantidad de tareas manuales necesarias para la administración del entorno.
* Mejorar la reproducibilidad del proyecto.
* Incorporar prácticas de automatización utilizadas habitualmente en entornos Kubernetes.

## Referencias de capturas

* Captura 6: Estructura del repositorio y archivos del proyecto.
* Captura 7: Ejecución del script de automatización 
* Captura 8: Verificación del despliegue.
