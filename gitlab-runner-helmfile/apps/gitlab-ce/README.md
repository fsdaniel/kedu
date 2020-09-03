``` 
helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm install gitlab gitlab/gitlab \
  --set global.edition=ce \
  --set certmanager-issuer.email=daniel.koopmans@gmail.com \
  --set global.hosts.domain=git.shiplog.io
```