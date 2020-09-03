``` 
docker build . -t registry.services.k8s.true.nl/onboarding/nginx-static-demo:1.0
```

``` 
docker build --build-arg CODE_VERSION=2.0 . -t registry.services.k8s.true.nl/onboarding/nginx-static-demo:2.0
```

``` 
export CODE_VERSION=3.0
docker build --build-arg CODE_VERSION . -t registry.services.k8s.true.nl/onboarding/nginx-static-demo:${CODE_VERSION}
```
Think continuous delivery in gitlab-ci using env `CI_COMMIT_TAG`

``` 
docker push registry.services.k8s.true.nl/onboarding/nginx-static-demo:1.0
```

## Replace PLACEHOLDER_DOMAIN with a domain name in file :
- k8s/ingress.yaml
