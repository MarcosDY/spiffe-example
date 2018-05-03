#!/bin/bash

declare -r NGINX_RELEASE="1.13.9spiffe4"
declare -r NGINX_FILE="nginx-${NGINX_RELEASE}"
declare -r NGINX_URL="https://github.com/spiffe/spiffe-nginx/releases/download/${NGINX_RELEASE}/${NGINX_FILE}.tgz"
declare -r NGINX_DIR="/usr/local/nginx"
declare -r NGINX_LOGS_DIR="${NGINX_DIR}/logs"

# Uncompress and move nginx
mkdir /opt/spiffe-nginx
curl --progress-bar --location ${NGINX_URL} | tar xzf -
mv -v ${NGINX_FILE}/nginx /opt/spiffe-nginx
rm -R ${NGINX_FILE}

# Create log folder 
mkdir -p ${NGINX_LOGS_DIR}
touch ${NGINX_LOGS_DIR}/access.log  ${NGINX_LOGS_DIR}/error.log
chmod 777 -R ${NGINX_LOGS_DIR}
chmod 777 ${NGINX_DIR}

# Create blog user
useradd -m nginx-blog

# There is a bug in docker where /dev/stdout return permission error
echo 'chmod 777 /dev/stdout' >> ~/.bashrc

# Clean installation files
rm install_nginx.sh