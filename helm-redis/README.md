Helm install of reds cluster master/slave
====
Ensure helm (3) is installed and sync with stable/charts repo.

Helm 3 installs in current namespace context by default, make sure it exists.

``` 
kubectl create ns apple-app
```

```
kubectl config set-context --current --namespace=apple-app
```

Customize options in values.yaml

``` 
helm install apple-app stable/redis -f values.yaml
```

``` 
kubectl get pods
```

```
helm delete apple-app
```