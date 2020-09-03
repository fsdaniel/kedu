## Manual steps

## Replace PLACEHOLDER_DOMAIN with your domainname in k8s/ingress.yaml and k8s/configmap-env.yaml 

## Create secrets from cli:
kubectl create secret generic mysql-pass --from-literal=password=KIES-EEN-WACHTWOORD
kubectl create secret generic laravel-app-key --from-literal=appkey=base64:xzQb7JdqpMkfHu1kbFBA4yKPawaMqVEqyNsILSuNqJc=

## Apply k8s/mysql manifest files
`kubectl apply -f k8s/mysql/mysql-deployment.yaml`

## Init database

`MYSQL_POD="$(kubectl get pods -l tier=mysql --output name)"`

```
kubectl exec "$MYSQL_POD" -- \
mysql -p$(kubectl get secret mysql-pass -o json | jq -r .data.password | base64 -d) \
-e "create database laravel"
```

## Build and push 

```
docker build . -t registry.services.k8s.true.nl/onboarding/laravel-app:1.0
```

```
docker build --build-arg CODE_VERSION=2.0 . -t registry.services.k8s.true.nl/onboarding/laravel-app:2.0
```

``` 
export CODE_VERSION=3.0
docker build --build-arg CODE_VERSION . -t registry.services.k8s.true.nl/onboarding/laravel-app:${CODE_VERSION}
```
Think continuous delivery in gitlab-ci using env `CI_COMMIT_TAG`

``` 
docker push registry.services.k8s.true.nl/onboarding/laravel-app:1.0
```


