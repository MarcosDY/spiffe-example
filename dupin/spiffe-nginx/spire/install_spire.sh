#!/bin/bash

declare -r SPIRE_RELEASE="0.5.1"
declare -r SPIRE_FILE="spire-${SPIRE_RELEASE}"
declare -r SPIRE_URL="https://github.com/spiffe/spire/releases/download/${SPIRE_RELEASE}/${SPIRE_FILE}-linux-x86_64-glibc.tar.gz"
declare -r SPIRE_DIR="/opt/spire"

curl --progress-bar --location ${SPIRE_URL} | tar xzf -
rm -rf ${SPIRE_DIR}
mv -v ${SPIRE_FILE} /opt/spire/
chmod -R 777 ${SPIRE_DIR}
mkdir ${SPIRE_DIR}/.data

# Clean installation files
rm install_spire.sh