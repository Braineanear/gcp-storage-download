#!/bin/sh

sudo apt install jq

jq -n $GCP_SERVICE_ACCOUNT_KEY_FILE > json_file.json

gcloud auth activate-service-account --key-file json_file.json

sh -c "gsutil cp gs://${GCP_STORAGE_BUCKET}/${DEST_DIR} ${SOURCE_DIR}"
  
gcloud auth revoke --all
  
shred -zvu -n 5 json_file.json
