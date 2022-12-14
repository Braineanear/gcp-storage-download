#!/bin/sh

echo '$GCP_SERVICE_ACCOUNT_KEY_FILE' > json_file.json

var = $(base64 json_file.json)

echo $var > json_file.json

gcloud auth activate-service-account --key-file json_file.json

sh -c "gsutil cp gs://${GCP_STORAGE_BUCKET}/${DEST_DIR} ${SOURCE_DIR}"
  
gcloud auth revoke --all
  
shred -zvu -n 5 json_file.json
