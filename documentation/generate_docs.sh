#!/usr/bin/env bash

set -e
set -o pipefail
set -u

function step { >&2 echo -e "\033[1m\033[36m* $@\033[0m"; }
function finish { >&2 echo -en "\033[0m"; }
trap finish EXIT

step "Checking for Jazzy installation"
if [ -z `which jazzy` ]; then
    echo "Jazzy not found on this machine. Installing jazzy…"
    gem install jazzy
    if [ -z `which jazzy` ]; then
        echo "Unable to install jazzy :("
        exit 1
    fi
fi

# Search for `s.version` in podspec, grab the first result, 
# and return only the version between quotes
VERSION=$( grep -n "s.version" MapboxAnnotationExtension.podspec | head -n 1 | cut -d \" -f2 )

step "Jazzy installed. \nGenerating docs for Mapbox Annotation Extension ${VERSION}..."

jazzy \
   --config documentation/jazzy.yml \
   --output documentation/api-docs \
   --readme README.md \
   --title Annotations Extension \
   --module-version v${VERSION}

step "Documentation generated for Annotation Extension ${VERSION}! \nPublish it by copying docs to a new pull request in ios-sdk."
