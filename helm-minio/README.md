Helm install minio s3 storage (single replica)
====
Ensure helm (3) is installed and sync with stable/charts repo.

Helm 3 installs in current namespace context by default, make sure it exists.

``` 
kubectl create ns minio
```

```
kubectl config set-context --current --namespace=minio
```

Customize options in values.yaml

``` 
helm install minio stable/minio -f values.yaml
```

``` 
kubectl get pods
```

```
helm delete minio
```