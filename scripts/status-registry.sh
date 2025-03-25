# Initialize a status list
# curl -X POST 'http://localhost:8280/api/v1/status/business-entities/{businessEntityId}/status-list-entries/' \
#   -H 'accept: application/json' \
#   -H 'Authorization: Bearer your token' \
#   -d ''
# get status list entry /api/v1/statuslist/{datastoreEntryId}.jwt
#STATUS_SPACE=$(curl -s -X POST "http://localhost:8280/api/v1/entry/" \
#STATUS_SPACE=$(curl -s -X POST "${STATUS_AUTHORING_ROOT}/api/v1/entry/" \

STATUS_SPACE=$(curl -s -X POST "${STATUS_AUTHORING_ROOT}/api/v1/status/business-entities/swiyu-parner-id/status-list-entries/" \
    -H 'accept: application/json' \
    -H "Authorization: Bearer $YOUR_AUTH_TOKEN" \
    -d "{}")

echo $STATUS_SPACE  #| jq .


STATUS_LIST_ID=$(echo "$STATUS_SPACE" | jq -r '.id')
echo "Status List ID=${STATUS_LIST_ID}"


#STATUS_READ_URL="${STATUS_ROOT}/api/v1/statuslist/${STATUS_LIST_ID}.jwt"
STATUS_READ_URL=$(echo "$STATUS_SPACE" | jq -r '.files.TokenStatusListJWT.readUri')
echo "Status read URL=${STATUS_READ_URL}"

# STATUS_ENTRY=$(curl -s -X GET "${STATUS_READ_URL}" \
#     -H 'accept: application/statuslist+jwt' \
#     -H "Authorization: Bearer $YOUR_AUTH_TOKEN")

# echo $STATUS_ENTRY