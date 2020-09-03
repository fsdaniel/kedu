Source:

https://operatorhub.io/operator/percona-xtradb-cluster-operator

``` 
curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.13.0/install.sh | bash -s 0.13.0
```

``` 
kubectl create -f https://operatorhub.io/install/percona-xtradb-cluster-operator.yaml
```

```
kubectl get csv -n my-percona-xtradb-cluster-operator
```

```
kubectl create namespace demo
```

```
kubectl config set-context --current --namespace=demo
```

