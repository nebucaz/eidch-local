# eidch-local

## Create DID

Post a new document to get the id (?)


```shell
java -jar didtoolbox.jar create --identifier-registry-url http://localhost:7080/api/v1/did/18fa7c77-9dd1-4e20-a147-fb1bec146085/did.jsonl
```

## Get AccessToken (cURL)
```shell
curl \
  -d "client_id=eidch" \  
  -d "client_secret=<secret>" \
  -d "grant_type=client_credentials" \
  "http://localhost:7080/realms/master/protocol/openid-connect/token"
```