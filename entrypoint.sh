#!/bin/sh

function validate_required_inputs {
  if [ -z "$GCP_STORAGE_BUCKET" ]; then
    echo "GCP_STORAGE_BUCKET is not set. Quitting."
    exit 1
  fi

  if [ -z "$GCP_SERVICE_ACCOUNT_KEY_FILE" ]; then
    echo "GCP_SERVICE_ACCOUNT_KEY_FILE is not set. Quitting."
    exit 1
  fi
  
  if [ -z "$SOURCE_DIR" ]
  then
    echo "SOURCE_DIR is not set. Quitting."
    exit 1
  fi

  if [ -z "$DEST_DIR" ]
  then
    echo "DEST_DIR is not set. Quitting."
    exit 1
  fi
}

function main {
  validate_required_inputs
  
  sudo apt install jq

  jq -n $GCP_SERVICE_ACCOUNT_KEY_FILE > json_file.json

  gcloud auth activate-service-account --key-file json_file.json

  sh -c "gsutil cp gs://${GCP_STORAGE_BUCKET}/${DEST_DIR} ${SOURCE_DIR}"
  
  gcloud auth revoke --all
  shred -zvu -n 5 json_file.json
}

main
