#!/usr/bin/env bash

set -e
set -o pipefail
set -u

echo "Generating docs..."

jazzy \
    --config jazzy.yml \

# We can remove the below line once https://github.com/realm/jazzy/pull/1077 merges
sed -i "" "s/BRANDLESS_DOCSET_TITLE/Annotations Extension/g" docs/index.html