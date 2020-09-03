PHP fast-cgi with nginx ingress as reverse proxy
===
This demo does not use a seperate NGINX reverse proxy but uses the ingress (nginx) controller directly.
``` 
docker build . -t registry.services.k8s.true.nl/onboarding/php-fastcgi-demo:1.0
```

``` 
docker build --build-arg CODE_VERSION=2.0 . -t registry.services.k8s.true.nl/onboarding/php-fastcgi-demo:2.0
```

``` 
export CODE_VERSION=3.0
docker build --build-arg CODE_VERSION . -t registry.services.k8s.true.nl/onboarding/php-fastcgi-demo:${CODE_VERSION}
```
Think continuous delivery in gitlab-ci using env `CI_COMMIT_TAG`

``` 
docker push registry.services.k8s.true.nl/onboarding/php-fastcgi-demo:1.0
```