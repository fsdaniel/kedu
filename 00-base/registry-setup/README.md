# Registry setup

k8s side
===
Secrets are namespace scoped.

Creating pull secret in kubernetes
``` 
  kubectl create secret generic onboarding-tmp-secret \
  --from-file=.dockerconfigjson=dockerconfig.json \
  --type=kubernetes.io/dockerconfigjson
```

Local dev or ci/cd
===
Local login for pushing (provided you have docker installed)
``` 
docker login registry.services.k8s.true.nl
```

tag a build/local container
``` 
docker tag SOURCE_IMAGE[:TAG] registry.services.k8s.true.nl/onboarding/IMAGE[:TAG]
```

push container image to remote repo for usage
``` 
docker push registry.services.k8s.true.nl/onboarding/IMAGE[:TAG]
```

