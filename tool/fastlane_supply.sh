#!/bin/bash
set -euo pipefail

PACKAGE_NAME=$(jq -r ".client[0].client_info.android_client_info.package_name" android/app/src/prod/google-services.json)

fastlane supply \
    --package_name "$PACKAGE_NAME" \
    --aab "build/app/outputs/bundle/prodRelease/app-prod-release.aab"
