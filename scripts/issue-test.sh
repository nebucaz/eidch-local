#!/bin/bash

# documentation: https://swiyu-admin-ch.github.io/cookbooks/onboarding-generic-issuer/

# get access token
YOUR_AUTH_TOKEN=$(curl -s -d "client_id=eidch" -d "client_secret=iUsyfcM0MXH8oHLsAMOV1HgVeCHuPjJP" -d "grant_type=client_credentials"  "http://localhost:7080/realms/master/protocol/openid-connect/token" | jq -r '.access_token')

# create offer
curl -X 'POST' 'http://localhost:8080/api/v1/credentials' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "metadata_credential_supported_id": [
    "university_example_sd_jwt"
  ],
  "credential_subject_data": {
    "degree": "Test",
    "name": "Test", "average_grade": 10
  },
  "offer_validity_seconds": 86400,
  "credential_valid_until": "2010-01-01T19:23:24Z",
  "credential_valid_from": "2010-01-01T18:23:24Z",
  "status_lists": [
    "https://status-list-uri"
  ]
}'

