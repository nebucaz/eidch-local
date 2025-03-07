
# get access token
YOUR_AUTH_TOKEN=$(curl -d "client_id=eidch" -d "client_secret=iUsyfcM0MXH8oHLsAMOV1HgVeCHuPjJP" -d "grant_type=client_credentials"  "http://localhost:7080/realms/master/protocol/openid-connect/token" | jq -r '.access_token')
echo $YOUR_AUTH_TOKEN

# register did space
DID_SPACE=curl -H "Authorization: Bearer $YOUR_AUTH_TOKEN" -X POST "http://localhost:8180/api/v1/entry"

echo "id= $(echo $DID_SPACE | jq -r '.id')"

# create DID
java -jar didtoolbox.jar create --identifier-registry-url <identifier_registry_url>
