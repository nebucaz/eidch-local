# eidch-local

## Get keycloak AccessToken (cURL)
```shell
YOUR_AUTH_TOKEN=$(curl -d "client_id=eidch" -d "client_secret=iUsyfcM0MXH8oHLsAMOV1HgVeCHuPjJP" -d "grant_type=client_credentials"  "http://localhost:7080/realms/master/protocol/openid-connect/token" | jq -r '.access_token')
export YOUR_AUTH_TOKEN
```


## Create DID Space
In order to onboard on the swiyu Base Registry you will first need to reserve some space.

**From the cookbook**
```shell
curl \
  -H "Authorization: Bearer $YOUR_AUTH_TOKEN" \
  -X POST "https://identifier-reg-api.trust-infra.swiyu-int.admin.ch/api/v1/identifier/business-entities/$YOUR_BUSINESS_ENTITY_ID/identifier-entries"

```

API Response 201
```json
{
 "id": "18fa7c77-9dd1-4e20-a147-fb1bec146085",
 "identifier_registry_url": "https://identifier-reg.trust-infra.swiyu-int.admin.ch/api/v1/did/18fa7c77-9dd1-4e20-a147-fb1bec146085/did.jsonl"
}
```

**Make the local call**
http://localhost:8180/swagger-ui/index.html

```shell
curl -H "Authorization: Bearer $YOUR_AUTH_TOKEN" -X POST "http://localhost:8180/api/v1/entry"
```

The answer is different from the example in the cookbook:
```json
{
  "id": "d3a1207e-28d8-4bcb-9827-2531080b6bd6",
  "status": "SETUP",
  "files": {
    "DID_WEB": {
      "readUri": "did:web:localhost%3A8190:api:v1:did:d3a1207e-28d8-4bcb-9827-2531080b6bd6",
      "isConfigured": false
    },
    "DID_TDW": {
      "readUri": "http://localhost:8190/api/v1/did/d3a1207e-28d8-4bcb-9827-2531080b6bd6",
      "isConfigured": false
    }
  }
}
```

There is no identifier-