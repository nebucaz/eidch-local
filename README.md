# eidch-local

## Get AccessToken (cURL)
```shell
curl \
  -d "client_id=eidch" \  
  -d "client_secret=<secret>" \
  -d "grant_type=client_credentials" \
  "http://localhost:7080/realms/master/protocol/openid-connect/token"
```