#!/bin/bash
set -euxo pipefail

version=$(cider version)

# 1.0.0+1 → 1.0.0
app_version=${version%%+*}

fastlane deliver \
    --skip_binary_upload true \
    --skip_screenshots true \
    --precheck_include_in_app_purchases false \
    --app_version "$app_version" \
    --force true \
    --app_identifier dev.kingu.listenToMusicByLocation

open "https://appstoreconnect.apple.com/apps/6471416156/distribution"
