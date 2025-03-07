
#!/bin/bash

# according to https://swiyu-admin-ch.github.io/cookbooks/onboarding-base-and-trust-registry/

# get access token
YOUR_AUTH_TOKEN=$(curl -s -d "client_id=eidch" -d "client_secret=iUsyfcM0MXH8oHLsAMOV1HgVeCHuPjJP" -d "grant_type=client_credentials"  "http://localhost:7080/realms/master/protocol/openid-connect/token" | jq -r '.access_token')

# register did space
DID_SPACE=$(curl -s -H "Authorization: Bearer $YOUR_AUTH_TOKEN" -X POST "http://localhost:8180/api/v1/entry/")
ID=$(echo "$DID_SPACE" | jq -r '.id')
echo "ID: ${ID}"

#echo "id= $(echo $DID_SPACE | jq -r '.id')"

IDENTIFIER_REGISTRY_URL="http://localhost:8190/api/v1/did/${ID}/did.jsonl"
echo "Registry URL: $IDENTIFIER_REGISTRY_URL"

# create DID
YOUR_GENERATED_DIDLOG=$(java -jar didtoolbox.jar create --identifier-registry-url "$IDENTIFIER_REGISTRY_URL")

# move away the keys
mkdir -p "./did"
mv .didtoolbox "./did/${ID}"

DID_LOG="./did/${ID}/did.jsonl"
# remove trailing new line
echo "$YOUR_GENERATED_DIDLOG" > $DID_LOG

# Upload DID log
#   -X PUT "https://identifier-reg-api.trust-infra.swiyu-int.admin.ch/api/v1/identifier/business-entities/$YOUR_BUSINESS_ENTITY_ID/identifier-entries/$ID_FROM_PREVIOUS_STEP"
IDENTIFIER_PUT_URL="http://localhost:8180/api/v1/did/${ID}/did.jsonl"

RESULT=$(curl -s -X PUT "${IDENTIFIER_PUT_URL}" \
    -H "Authorization: Bearer $YOUR_AUTH_TOKEN" \
    -H "Content-Type: application/jsonl+json" \
    -H 'Content-Type: application/json' \
    -d "${YOUR_GENERATED_DIDLOG}")

STATUS=$(echo "$RESULT" | jq -r '.status')
# check, if status active
if [ "$STATUS" != "ACTIVE" ]; then
    echo "Error: The status is not ACTIVE, it is $STATUS."
    exit 1
fi

echo "did ${ID} successfully registered"

# Initialize a status list
# curl -X POST 'http://localhost:8280/api/v1/status/business-entities/{businessEntityId}/status-list-entries/' \
#   -H 'accept: application/json' \
#   -H 'Authorization: Bearer your token' \
#   -d ''

# get status list entry /api/v1/statuslist/{datastoreEntryId}.jwt
STATUS_SPACE=$(curl -s -X POST "http://localhost:8280/api/v1/entry/" \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $YOUR_AUTH_TOKEN")

echo $STATUS_SPACE

# Update status list
# curl -X PUT 'https://status-reg-api.trust-infra.swiyu-int.admin.ch/api/v1/status/business-entities/{businessEntityId}/status-list-entries/{statusRegistryEntryId}' \
#   -H 'Content-Type: application/statuslist+jwt' \
#   -d 'Status list content according to https://www.ietf.org/archive/id/draft-ietf-oauth-status-list-02.html#name-status-list-request'

