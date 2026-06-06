# 01 - Despliegue inicial de aplicación web en Kubernetes

## Objetivo

El objetivo de esta etapa fue validar el correcto funcionamiento del clúster Kubernetes mediante el despliegue de una aplicación web simple, la exposición del servicio, el escalado de réplicas y la realización de una prueba básica de recuperación ante fallos.

## Verificación del clúster

Una vez finalizada la instalación de K3s, se verificó el estado del nodo utilizando el comando:

```bash
sudo kubectl get nodes
```

El resultado indicó que el nodo se encontraba en estado **Ready**, confirmando que el clúster se encontraba operativo y preparado para recibir cargas de trabajo.

**Referencia:** Captura 1.

Posteriormente se verificó el estado de los componentes internos de Kubernetes mediante:

```bash
sudo kubectl get pods -A
```

Los pods correspondientes a los servicios internos del sistema se encontraban en estado **Running**, lo que confirmó el correcto funcionamiento de la instalación.

**Referencia:** Captura 1.

## Creación del Deployment

Para la primera prueba se seleccionó la imagen oficial de Nginx debido a su simplicidad y bajo consumo de recursos.

El Deployment fue creado mediante el siguiente comando:

```bash
sudo kubectl create deployment nginx --image=nginx
```

Posteriormente se verificó la correcta creación del Deployment y del pod asociado utilizando:

```bash
sudo kubectl get deployments
sudo kubectl get pods
```

La aplicación fue desplegada correctamente y el pod se encontró en estado **Running**.

**Referencia:** Captura 2.

## Exposición del servicio

Con el objetivo de permitir el acceso a la aplicación desde la red, se creó un servicio de tipo NodePort mediante:

```bash
sudo kubectl expose deployment nginx --port=80 --type=NodePort
```

La configuración fue verificada utilizando:

```bash
sudo kubectl get services
```

El servicio fue creado correctamente y quedó asociado al Deployment de Nginx.

**Referencia:** Captura 3.

## Escalado de réplicas

Para implementar una configuración con mayor disponibilidad, el Deployment fue escalado a tres réplicas mediante:

```bash
sudo kubectl scale deployment nginx --replicas=3
```

Posteriormente se verificó la existencia de tres pods activos mediante:

```bash
sudo kubectl get deployments
sudo kubectl get pods
```

El Deployment mostró tres réplicas disponibles y los tres pods se encontraron en estado Running.

**Referencia:** Captura 4.

## Prueba de recuperación ante fallos

Con el fin de demostrar la capacidad de recuperación automática de Kubernetes, se eliminó manualmente uno de los pods pertenecientes al Deployment.

```bash
sudo kubectl delete pod nginx-56c45fd5ff-g5hvl
```

Luego de la eliminación, Kubernetes detectó que la cantidad de réplicas en ejecución era inferior a la definida en la configuración del Deployment. Como resultado, el sistema creó automáticamente una nueva instancia para restaurar el estado deseado.

La recuperación fue comprobada observando la aparición de un nuevo pod en estado Running y con un tiempo de creación reciente (AGE).

**Referencia:** Captura 5.

## Resultados obtenidos

Durante esta etapa se logró:

* Verificar el correcto funcionamiento del clúster Kubernetes.
* Desplegar una aplicación web basada en Nginx.
* Exponer la aplicación mediante un Service tipo NodePort.
* Escalar el Deployment a múltiples réplicas.
* Comprobar la recuperación automática ante fallos.
* Validar el mecanismo de mantenimiento del estado deseado implementado por Kubernetes.

## Referencias de capturas

* Captura 1: Nodo Kubernetes.
* Captura 2: Deployment y pod de Nginx en ejecución.
* Captura 3: Service tipo NodePort creado para Nginx.
* Captura 4: Deployment escalado a tres réplicas.
* Captura 5: Eliminación y recuperación de un pod.

