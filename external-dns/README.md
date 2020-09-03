## In this example we use Cloudflare as external dns provider.

## Create a API key 
visit https://dash.cloudflare.com/profile and create API credentials with permissions to edit DNS records

```
Permissions:

Zone - DNS - Edit
Zone - Zone - Read
Zone - Zone settings - Read

--
Zone resources:

Include - All zones
```

## Replace PLACEHOLDER_DOMAIN and PLACEHOLDER_API_KEY with the correct information in file:

- k8s/03-deployment.yaml

