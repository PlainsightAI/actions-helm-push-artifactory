#!/bin/sh -l

export PATH=/usr/local/bin:$PATH

# Verify that wget/tar exist on the system
apt-get update -y && apt-get install wget tar git -y

# Download Helm and extract it to /usr/local/bin
wget https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz
tar -zxvf helm-v3.7.1-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

# Setup Helm
/usr/local/bin/helm plugin install https://github.com/belitre/helm-push-artifactory-plugin --version=1.0.2
/usr/local/bin/helm repo add artifactory "$2" --username="$3" --password="$4"

# Push
output=$(/usr/local/bin/helm push-artifactory "$1" artifactory --skip-reindex 2>&1)

# Set Output
echo "::set-output name=output::$output"