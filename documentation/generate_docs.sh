#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "Generating docs..."
# platform/ios/jazzy.yml
jazzy \
    --config annotations-framework-extension/documentation/jazzy.yml \
    --output annotations-framework-extension/documentation/api-docs \
    --readme annotations-framework-extension/README.md \
    --title "Annotations Extension" \
    --module-version v0.0.0-alpha.2
