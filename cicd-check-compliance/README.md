### Conftest

Using OpenPolicyAgents rego checks its possible ensure rules are enforced on yaml before you apply
to your k8s platform. In this case rules are located in the `policy` dir.

```
docker run --rm -v $(pwd):/project instrumenta/conftest:latest test k8s/deployment.yaml
```
check exit code
```
echo $?
```

Daniel notes for windows docker client
``` 
docker run --rm -v C:\pro\kedu\cicd-check-compliance:/project instrumenta/conftest:latest test k8s/deployment.yaml
```


### Kubeval

Kubeval tests your yaml that you want to apply to your cluster for valid specs. Dont try to validate CRD's.

``` 
docker run --rm -v $(pwd):/project garethr/kubeval /project/k8s/deployment-bad.yaml
```
Daniel notes for windows docker client
``` 
docker run --rm -v C:\pro\kedu\cicd-check-compliance:/project garethr/kubeval /project/k8s/deployment-bad.yaml
```

###gitlab-ci.yaml
Contains example pipeline to check/verify using contest and kubeval
