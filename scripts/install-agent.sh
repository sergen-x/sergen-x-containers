#!/bin/bash

download_url="https://api.github.com/repos/sergen-x/sergen-x-agent/releases/latest"
response=$(curl -s "$download_url")

if grep -q '"message": "Not Found"' <<< "$response"; then
    echo "FATAL: Unable to download Sergen-X-Agent - Not found."
    exit 1
fi

first_asset_download_url=$(grep -o '"browser_download_url": "[^"]*' <<< "$response" \
    | head -n1 \
    | cut -d '"' -f 4)

if [ -z "$first_asset_download_url" ]; then
    echo "FATAL: Unable to download Sergen-X-Agent - No assets found."
    exit 1
fi

echo "INFO: Downloading latest version of Sergen-X-Agent..."
if curl -LO "$first_asset_download_url"; then
    echo "SUCCESS: Downloaded Sergen-X-Agent."
else
    echo "FATAL: Failed to download Agent - An unknown error occured while attempting to download GitHub asset."
    exit 1
fi

if ! tar -xzf *.tar.gz; then
    echo "FATAL: Failed to extract Sergen-X-Agent."
    exit 1
fi

echo "SUCCESS: Extracted Sergen-X-Agent."
rm -f build.tar.gz
echo "INFO: Deleted build.tar.gz."