TRUE hello world with nginx ingress as reverse proxy
===
This demo displays the pod you're in.  
``` 
docker build . -t registry.services.k8s.true.nl/onboarding/true-hello-world:1.0
```

``` 
docker build --build-arg CODE_VERSION=2.0 . -t registry.services.k8s.true.nl/onboarding/true-hello-world:2.0
```

``` 
export CODE_VERSION=3.0
docker build --build-arg CODE_VERSION . -t registry.services.k8s.true.nl/onboarding/true-hello-world:${CODE_VERSION}
```
Think continuous delivery in gitlab-ci using env `CI_COMMIT_TAG`

``` 
docker push registry.services.k8s.true.nl/onboarding/true-hello-world:1.0
```
