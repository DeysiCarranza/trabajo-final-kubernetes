# 04 - Implementación de ConfigMaps, Secrets y análisis de logs

## Objetivo

El objetivo de esta etapa fue incorporar mecanismos de administración de configuraciones y datos sensibles mediante ConfigMaps y Secrets de Kubernetes, así como realizar la verificación del funcionamiento de la aplicación a través del análisis de logs.

## Implementación de ConfigMap

Se creó el archivo `configmap-nginx.yaml`, que define un recurso ConfigMap llamado `nginx-config`.

Este recurso almacena variables de configuración utilizadas por la aplicación:

* APP_NAME
* APP_ENV

La utilización de ConfigMaps permite separar la configuración de la aplicación de la definición del contenedor, facilitando la administración y modificación de parámetros sin necesidad de reconstruir imágenes.

## Implementación de Secret

Se creó el archivo `secret-nginx.yaml`, que define un recurso Secret llamado `nginx-secret`.

Este recurso almacena información sensible utilizada por la aplicación:

* APP_PASSWORD

Los Secrets permiten gestionar datos sensibles de forma organizada dentro del clúster Kubernetes, evitando incluir este tipo de información directamente en los archivos de despliegue.

## Integración con el Deployment

El Deployment fue modificado para consumir los valores definidos en el ConfigMap y en el Secret mediante variables de entorno.

Durante las pruebas se verificó que las variables fueron correctamente inyectadas en los contenedores mediante el comando:

```bash
kubectl exec -it nginx-75c595f7f5-nq87n -- env | grep APP
```

Resultado obtenido:

```text
APP_NAME=Trabajo Final Kubernetes
APP_ENV=Produccion
APP_PASSWORD=demo123
```

Esto confirmó que los recursos fueron correctamente asociados al Deployment.

## Análisis de logs

Como parte de las tareas de monitoreo básico, se realizó la consulta de logs de uno de los pods desplegados mediante:

```bash
kubectl logs nginx-75c595f7f5-nq87n
```

Los registros mostraron el proceso de inicialización de Nginx y la puesta en funcionamiento correcta del servicio, sin errores durante el arranque.

## Resultados obtenidos

Durante esta etapa se logró:

* Implementar ConfigMaps para la gestión de configuraciones.
* Implementar Secrets para el almacenamiento de información sensible.
* Integrar ambos recursos con el Deployment de Kubernetes.
* Verificar la correcta propagación de variables al contenedor.
* Analizar los logs de la aplicación desplegada.
* Completar los mecanismos de monitoreo previstos para el proyecto.

## Referencias de capturas

* Captura 10: Creación y verificación de ConfigMap,  Secret y Pods.
* Captura 11: Consulta de logs del contenedor Nginx.
* Captura 12: Validación de variables provenientes de ConfigMap y Secret.
