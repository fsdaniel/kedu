## IMPORTANT: you MUST install the cert-manager CRDs **before** installing the
## cert-manager Helm chart
```
kubectl apply --validate=false \
    -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.13/deploy/manifests/00-crds.yaml
```

## Add the Jetstack Helm repository
```
helm repo add jetstack https://charts.jetstack.io
```

## Update helm repository cache
```
helm repo update
```

## Create cert-manager namespace
```
kubectl create namespace cert-manager
```

## Install the cert-manager helm chart
```
helm install cert-manager --namespace cert-manager jetstack/cert-manager -f values-prod.yaml
```

## Add the Let's Encrypt staging issuer to the cluster
```
kubectl apply -f cluster-issuer-staging.yaml
kubectl apply -f cluster-issuer-prod.yaml  
```
