# eidch-local

# Keycloak
## Client configuration (eidch)

```json
{
      "id": "b0d22cb3-f64a-4117-ad7e-243a99dc4230",
      "clientId": "eidch",
      "name": "EID-CH",
      "description": "Cliet for eID -CH tests",
      "rootUrl": "",
      "adminUrl": "",
      "baseUrl": "",
      "surrogateAuthRequired": false,
      "enabled": true,
      "alwaysDisplayInConsole": false,
      "clientAuthenticatorType": "client-secret",
      "secret": "**********",
      "redirectUris": [
        "/*"
      ],
      "webOrigins": [
        "/*"
      ],
      "notBefore": 0,
      "bearerOnly": false,
      "consentRequired": false,
      "standardFlowEnabled": true,
      "implicitFlowEnabled": true,
      "directAccessGrantsEnabled": true,
      "serviceAccountsEnabled": true,
      "publicClient": false,
      "frontchannelLogout": true,
      "protocol": "openid-connect",
      "attributes": {
        "oidc.ciba.grant.enabled": "false",
        "client.secret.creation.time": "1741103761",
        "backchannel.logout.session.required": "true",
        "display.on.consent.screen": "false",
        "oauth2.device.authorization.grant.enabled": "true",
        "backchannel.logout.revoke.offline.tokens": "false"
      },
      "authenticationFlowBindingOverrides": {},
      "fullScopeAllowed": true,
      "nodeReRegistrationTimeout": -1,
      "protocolMappers": [
        {
          "id": "71a9ba53-6559-4a37-8840-c9a7ed827844",
          "name": "Client IP Address",
          "protocol": "openid-connect",
          "protocolMapper": "oidc-usersessionmodel-note-mapper",
          "consentRequired": false,
          "config": {
            "user.session.note": "clientAddress",
            "introspection.token.claim": "true",
            "id.token.claim": "true",
            "access.token.claim": "true",
            "claim.name": "clientAddress",
            "jsonType.label": "String"
          }
        },
```

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

There is no identifier-url. Let's construct it from the API-description:
```
DID_SPACE=$(curl -s -H "Authorization: Bearer $YOUR_AUTH_TOKEN" -X POST "http://localhost:8180/api/v1/entry/")
ID=$(echo "$DID_SPACE" | jq -r '.id')
IDENTIFIER_REGISTRY_URL="http://localhost:8190/api/v1/did/${ID}/did.jsonl"
```
### Create DID using didtoolkit

```shell
java -jar didtoolbox.jar create --identifier-registry-url "$IDENTIFIER_REGISTRY_URL")
```

### Upload the did-log to the base registry

```
curl -s -X PUT "${IDENTIFIER_PUT_URL}" \
    -H "Authorization: Bearer $YOUR_AUTH_TOKEN" \
    -H "Content-Type: application/jsonl+json" \
    -H 'Content-Type: application/json' \
    -d "${YOUR_GENERATED_DIDLOG}"
```

# Issuer
[Generic issuer cookbook](https://swiyu-admin-ch.github.io/cookbooks/onboarding-generic-issuer/)

## Issuer Agent Management environment
|VAR|Description|Example|
|---|-----------|-------|
|SPRING_APPLICATION_NAME|Name of your application||
|ISSUER_ID|The did you got in the onboarding (id in the did.jsonl)|did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e|
|DID_STATUS_LIST_VERIFICATION_METHOD|DID + Verification Method|did:tdw:QmWoSFDNQTQ3oMRghG4mxFD2oYgYz6zfFSeZEduNRTzUXW:localhost%3A8190:api:v1:did:cfda585f-a963-43b0-8247-7d8188c53a1e#assert-key-01|
|STATUS_LIST_KEY|EC Private key used to update the status list||
|SWIYU_PARTNER_ID|n/a||
|SWIYU_STATUS_REGISTRY_CUSTOMER_KEY|n/a||
|SWIYU_STATUS_REGISTRY_CUSTOMER_SECRET|||
|SWIYU_STATUS_REGISTRY_BOOTSTRAP_REFRESH_TOKEN|||
|SWIYU_STATUS_REGISTRY_TOKEN_URL|||
|SWIYU_STATUS_REGISTRY_API_URL|||

The script `scripts/register-did.sh` takes care of the above steps (create and register did, populate the VARs in `.env`)
After running the script, the issuer maz be started:

`docker-compose -f docker-compose-issuer.yml -f issuer-override.yml up postgres-issuer eidch-issuer-agent-management`

When the issuer-management is running, initialize the status-list:

```shell
curl -X POST "https://${ISSUER_MGMT}/api/v1/status-list" \
-H "Content-Type: application/json" \
-d '{
    "uri": "${STATUS_JWT_URL}",
    "type": "TOKEN_STATUS_LIST",
    "maxLength": 800000,
    "config": {
    "bits": 2
    }
  }'
```

**Example**
```shell
curl -X POST "http://localhost:8080/api/v1/status-list" \
-H "Content-Type: application/json" \
-d '{
    "uri": "${STATUS_JWT_URL}",
    "type": "TOKEN_STATUS_LIST",
    "maxLength": 800000,
    "config": {
    "bits": 2
    }
  }'
```


## Issuer Agent OID4VCI
|VAR|Description|Example|
|-|-|-|
|EXTERNAL_URL|||
|ISSUER_ID|Issuer DID||
|DID_SDJWT_VERIFICATION_METHOD|DID+Verification Method||
|SDJWT_KEY|EC Private key used to sign credentials||

## Create a verifiable credential schema
In order to support your use case you need to adapt the so-called issuer_metadata (see sample.compose.yml). Those metadata define the appearance of the credential in the wallet and what kind of credential formats are supported. For further information consult the VC visual presentation cookbook.

** example **
```yaml
configs:
  issuer_metadata:
    content: |
      {
        "credential_issuer": "${external-url}",
        "credential_endpoint": "${external-url}/credential",
        "credential_response_encryption": {
          "encryption_required": false,
          "alg_values_supported": [
            "RSA-OAEP-256",
            "ECDH-ES+A128KW"
          ],
          "enc_values_supported": [
            "A128CBC-HS256"
          ]
        },
        "display": [
          {
            "name": "Mein Test VC",
            "locale": "de-CH",
            "logo": {
              "uri": "data:image/png;base64,here-baseimagestring"
            }
          },
          {
            "name": "My test vc",
            "locale": "en-US",
            "logo": {
              "uri": "data:image/png;base64,here-baseimagestring"
            }
          }
        ],
        "credential_configurations_supported": {
          "my-test-vc": {
            "format": "vc+sd-jwt",
            "cryptographic_binding_methods_supported": [
              "did:tdw"
            ],
            "credential_signing_alg_values_supported": [
              "Ed25519VerificationKey2020"
            ],
            "proof_types_supported": {
              "jwt": {
                "proof_signing_alg_values_supported": [
                  "ES256",
                  "ES512"
                ]
              }
            },
            "display": [
              {
                "name": "Demo-VC",
                "locale": "de-CH",
                "logo": {
                  "uri": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAACPSURBVHgB7ZbbCYAwDEVvxEHcREdzlI7gCHUDN9AtfEJM0S9BUWwrSA5cWujHgdA2oWFcWhAyxKGjYVpYNpaZawSEiHJZCjhhP84lAuMczpUgMir8Tii32PBGiRdoSVWoQhX+UJjiOfnJf9pIV68QQFjsOWIkXoVGYi/OO9zgtlDKZeEBfRbeiT4IU+xRfwVePD+H6WV/zQAAAABJRU5ErkJggg=="
                },
                "description": "Das ist ein Test-VC",
                "background_color": "#ff69b4"
              },
              {
                "name": "Demo-VC",
                "locale": "en-US",
                "logo": {
                  "uri": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAACxIAAAsSAdLdfvwAAACaSURBVEhLYxgFo2DQA0YoTRB89v0sfp/7PsMr7lcMLnNdXgGF/kNkSANMUBov+M/wn/Hfv38vmBmZX/xl/vtiVf0qVqgUyYAoC6kJRi2kOhi1kOpg1EKqA7pbSFThDSpLP3l/+veE7wnDE14gxkG/534vxmDH8BqqDSsYxEH6n+EpkARjoI9R8X8IzfCT4R9Y7SgYBUMYMDAAAMQ3Q6IEloWyAAAAAElFTkSuQmCC"
                },
                "description": "This is an test vc",
                "background_color": "#4A412A"
              }
            ],
              "vct": "my-test-vc",
            "claims": {
              "id": {
                "mandatory": true,
                "value_type": "string",
                "display": [
                  {
                    "locale": "de-CH",
                    "name": "Holder binding key"
                  },
                  {
                    "locale": "fr-CH",
                    "name": "Holder binding key"
                  },
                  {
                    "locale": "it-CH",
                    "name": "Holder binding key"
                  },
                  {
                    "locale": "en-US",
                    "name": "Holder binding key"
                  }
                ]
              },
              "lastName": {
                "mandatory": false,
                "value_type": "string",
                "display": [
                  {
                    "locale": "de-CH",
                    "name": "Name"
                  },
                  {
                    "locale": "fr-CH",
                    "name": "Nom de famille"
                  },
                  {
                    "locale": "it-CH",
                    "name": "Cognome"
                  },
                  {
                    "locale": "en-US",
                    "name": "Last name"
                  }
                ]
              },
              "firstName": {
                "mandatory": false,
                "value_type": "string",
                "display": [
                  {
                    "locale": "de-CH",
                    "name": "Vorname"
                  },
                  {
                    "locale": "fr-CH",
                    "name": "Prénom"
                  },
                  {
                    "locale": "it-CH",
                    "name": "Nome"
                  },
                  {
                    "locale": "en-US",
                    "name": "First name"
                  }
                ]
              }
            },
            "order": [
              "id",
              "lastName",
              "firstName"
            ]
          }
        }
      }
```

## Become a trusted participantPermalink

To be acclaimed as a trusted issuer or verifier you need to additionally contact us by using the form found on the swiyu Trust Infrastructure service



## Initialize the status

Once the issuer-agent-management, issuer-agent-oid4vci and postgres instance are up and running you need to initialize the status list of your issuer so that you can issue credentials.

Request to create an status list slot
The url you’ll receive in the response will be used in the next request as STATUS_JWT_URL

The following request needs to be run on your issuer-agent-management instance.

```shell
curl -X POST https://<EXTERNAL_URL of issuer-agent-management>/status-list \
-H "Content-Type: application/json" \
-d '{
    "uri": "<STATUS_JWT_URL>",
    "type": "TOKEN_STATUS_LIST",
    "maxLength": 800000,
    "config": {
    "bits": 2
    }
  }'
  ```


## Issue credential

You’re now ready to issue credentials by using the issuer-agent-management API which is accessible under https://<”EXTERNAL_URL of issuer-agent-management”>/swagger-ui/index.html#/Credential%20API/createCredential to create a credential offer for a holder. Here is an example of a request body for the offer creation

