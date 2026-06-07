# 03 - Monitoreo básico del clúster Kubernetes

## Objetivo

El objetivo de esta etapa fue implementar un mecanismo sencillo de monitoreo para verificar el estado de los recursos desplegados en Kubernetes.

## Desarrollo

Se creó el script `scripts/monitor.sh`, encargado de consultar y mostrar información relevante del clúster.

El script realiza las siguientes verificaciones:

* Estado de los nodos.
* Estado de los Deployments.
* Estado de los Pods.
* Estado de los Services.

La información es obtenida mediante comandos `kubectl` y presentada de forma ordenada para facilitar la supervisión del entorno.

## Ejecución

El monitoreo puede ejecutarse mediante:

```bash
./scripts/monitor.sh
```

## Resultados obtenidos

Durante las pruebas se verificó que:

* El nodo principal del clúster se encontraba en estado Ready.
* El Deployment de Nginx estaba disponible y operativo.
* Las tres réplicas de la aplicación se encontraban en estado Running.
* El Service NodePort permanecía accesible.

## Beneficios

La utilización de este script permite obtener rápidamente una visión general del estado del clúster y de la aplicación desplegada, facilitando las tareas básicas de administración y supervisión.

## Referencias de capturas

* Captura 9: Ejecución del script de monitoreo del clúster.
