#!/usr/bin/python

import os
import requests
import qrcode
import json
import urllib.parse
from datetime import datetime, UTC
from dateutil.relativedelta import relativedelta
from dotenv import load_dotenv

# get from .env
load_dotenv()

ISSUER_MGMT_API_URL = "http://localhost:8080"
#TOKEN_STATUS_LIST_ID = "6cd90604-00e7-44e1-9933-96da44d95e3c"
#TOKEN_STATUS_LIST_JWT_URL = f"http://status-registry.home.rwpz.net/api/v1/statuslist/{TOKEN_STATUS_LIST_ID}.jwt"
#OID4VCI_SIGNER_URL = "https://issuer-oid4vci.home.rwpz.net"

TOKEN_STATUS_LIST_ID = os.getenv('STATUS_LIST_ID')
TOKEN_STATUS_LIST_JWT_URL = os.getenv('STATUS_JWT_URL')
OID4VCI_SIGNER_URL = os.getenv('EXTERNAL_URL')

datetime_now = datetime.now(UTC)
CREDENTIAL_VALID_FROM = datetime_now.strftime('%Y-%m-%dT%H:%M:%SZ')
CREDENTIAL_VALID_UNTIL = ((datetime_now + relativedelta(years=3))
                          .strftime('%Y-%m-%dT%H:%M:%SZ'))


def show_qrcode(string_to_encode):
    img = qrcode.make(string_to_encode)

    # Show QR Code
    img.show()  # Opens in default image viewer

    # Optionally save to file
    img.save(f"credential_offers/offer_{offer_id}.png")


def verify_status_list(statusListId):
    url = f"{urllib.parse.urljoin(ISSUER_MGMT_API_URL,
                                  "/api/v1/status-list/")}{statusListId}"
    headers = {
        'Accept': 'application/json'
    }
    response = requests.get(url, headers=headers)

    try:
        response.raise_for_status()
        return True
    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    return False


def register_status_list():
    payload = {
        "type": "TOKEN_STATUS_LIST",
        "maxLength": 800000,
        "config": {
            "bits": 2
        }
    }
    headers = {
        'Accept': 'application/json'
    }
    response = requests.post(urllib.parse.urljoin(ISSUER_MGMT_API_URL,
                                                  "/api/v1/status-list"),
                             json=payload,
                             headers=headers)
    try:
        response.raise_for_status()
        data = response.json()
        status_registry_id = data.get('id', None)
        status_registry_url = data. get('statusRegistryUrl')
        print(f"registered new status-list. ID={status_registry_id}, "
              f"statusListURL={status_registry_url}")

        return status_registry_id, status_registry_url

    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")


def get_credential_offer(status_registry_url):

    # 'Authorization': 'Bearer YOUR_ACCESS_TOKEN'  # Optional, if needed
    headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
    }

# neu ab 1.1.3
#  "credential_metadata": {
#    "vct#integrity": "sha256-0000000000000000000000000000000000000000000="
#  },

    payload = {
        "metadata_credential_supported_id": [
            "university_example_sd_jwt"
        ],
        "credential_subject_data": {
            "degree": "Test",
            "name": "Test", "average_grade": 10
        },
        "offer_validity_seconds": 86400,
        "credential_valid_until": CREDENTIAL_VALID_UNTIL,
        "credential_valid_from":  CREDENTIAL_VALID_FROM,
        "status_lists": [status_registry_url]
    }

    # Fetch the string from REST API
    response = requests.post(urllib.parse.urljoin(ISSUER_MGMT_API_URL,
                                                   "/api/v1/credentials"),
                             json=payload,
                             headers=headers)

    try:
        response.raise_for_status()
        data = response.json()  # Assuming JSON, adapt as needed
        return data
    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")

        try:
            error_data = response.json()  # If response contains JSON
            print("Error details:", error_data)
        except ValueError:
            # Not a JSON response (plain text or empty)
            print("Raw response:", response.text)
    except Exception as err:
        print(f"Other error occurred: {err}")
        print(f"Status Code: {response.status_code}")
        data = response.json()
        print(data)
    return None


def get_bearer_from_pre_auth_code(pre_authorized_code):
        # check code -> consumes pre-auth-grant!!
    headers = {
        'Accept': 'application/json'
    }
    params = {
        "grant_type": "urn:ietf:params:oauth:grant-type:pre-authorized_code",
        "pre-authorized_code": pre_authorized_code
    }

    mgmt_api_url = urllib.parse.urljoin(OID4VCI_SIGNER_URL, '/api/v1/token')
    request_url = f"{mgmt_api_url}?{urllib.parse.urlencode(params)}"

    response = requests.post(request_url,
                             json="{}",
                             headers=headers)
    response.raise_for_status()
    data = response.json()
    print(data)


if __name__ == "__main__":
    status_list_id = TOKEN_STATUS_LIST_ID
    status_registry_url = TOKEN_STATUS_LIST_JWT_URL

    if not verify_status_list(status_list_id):
        status_list_id, status_registry_url = register_status_list()
        if not id:
            print("no status list available")
            exit(1)
        else:
            print("UPDATE ENV!!")

    # if not status_registry_url:
    #    status_registry_url = f"http://status-registry.home.rwpz.net/api/v1/statuslist/{status_list_id}.jwt"

    data = get_credential_offer(status_registry_url)
    offer_id = data.get('management_id', None)
    if not offer_id:
        print("malformed response")
        print(data)
        exit(1)

    print(f"offer-id={offer_id}")
    string_to_encode = data.get('offer_deeplink', None)

    print("encoding offer_deeplink:")
    print(string_to_encode)

    parsed_url = urllib.parse.urlparse(string_to_encode)
    query_string = parsed_url.query
    credential_offer = urllib.parse.parse_qs(query_string).get('credential_offer', [None])[0]
    credential_offer_json = json.loads(credential_offer)

    #print(credential_offer)

    grants = credential_offer_json.get("grants")
    grant_type = grants.get("urn:ietf:params:oauth:grant-type:pre-authorized_code")
    pre_authorized_code = grant_type.get("pre-authorized_code")
    print(f"pre-authorized_code: {pre_authorized_code}")

    # Generate QR Code
    show_qrcode(string_to_encode)


