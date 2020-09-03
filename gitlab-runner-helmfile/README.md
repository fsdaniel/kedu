install gitlab + runners
---

install helmfile
``` 
wget https://github.com/roboll/helmfile/releases/download/v0.98.2/helmfile_linux_amd64
chmod +x helmfile_linux_amd64
sudo mv helmfile_linux_amd64 /usr/local/bin/helmfile
helm plugin install https://github.com/databus23/helm-diff --version master
```

``` 
for d in runners/*; do helmfile -f $d diff; if [ $? -eq 2 ]; then helmfile -f $d sync; fi; done
```