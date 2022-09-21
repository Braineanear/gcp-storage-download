FROM google/cloud-sdk:alpine

LABEL "com.github.actions.name"="GCP Storage Download"
LABEL "com.github.actions.description"="Sync a directory from an GCP Storage"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="blue"

LABEL version="1.0.0"
LABEL repository="https://github.com/Braineanear/gcp-storage-download"
LABEL homepage="https://github.com/Braineanear/"
LABEL maintainer="Mahmoud Yasser <mle.mahmoud.yasser@gmail.com>"

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
