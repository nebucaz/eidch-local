#!/bin/bash

# Check if ID (directory name) is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <ID directory name>"

  echo "chosse one from './did':"
  # List directories inside ./keys
  #find ./did -mindepth 1 -maxdepth 1 -type d -exec basename {} \;
  #exit 1
  PS3="Enter the number of the directory to select: "
  select ISSUER_ID in $(find ./did -mindepth 1 -maxdepth 1 -type d -exec basename {} \;); do
    if [ -z "$ISSUER_ID" ]; then
      echo "Invalid selection. Please select a valid directory."
    else
      break
    fi
  done
else
  # Use the provided ID if it's passed as a parameter
  ISSUER_ID="$1"
fi

# Assign directory name
#ISSUER_ID="$1"

# Path to private key
KEY_FILE="./did/${ISSUER_ID}/assert-key-01"

# Path to did-log key
DID_LOG="./did/${ISSUER_ID}/did.jsonl"

# Check if key file exists
if [ ! -f "$KEY_FILE" ]; then
  echo "Private key file not found: $KEY_FILE"
  exit 1
fi

# Check JSONL file
if [ ! -f "$DID_LOG" ]; then
  echo "JSONL file not found: $DID_LOG"
  exit 1
fi

# Read and escape private key content
PRIVATE_KEY=$(awk '{printf "%s\\n", $0}' "$KEY_FILE")
ISSUER_DID=$(jq -r '.[3].value.id' "$DID_LOG")
if [ -z "$ISSUER_DID" ]; then
  echo "Failed to extract ID from $DID_LOG"
  exit 1
fi

# Customer secret (could also be passed or read from another secure location)
# CUSTOMER_SECRET="your_customer_secret_here"
#ISSUER_ID=$ISSUER_DID
#ASSERT_KEY=$PRIVATE_KEY


# Generate .env file
cat > .env <<EOF
ISSUER_DID=$ISSUER_DID
ASSERT_KEY=$PRIVATE_KEY
EOF

echo ".env file generated successfully for ID=$ISSUER_ID!"

