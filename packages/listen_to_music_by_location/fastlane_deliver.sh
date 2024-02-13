#!/bin/bash
set -euxo pipefail

fastlane deliver \
    --skip_binary_upload true \
    --skip_screenshots true \
    --precheck_include_in_app_purchases false \
    --force true \
    --app_identifier dev.kingu.listenToMusicByLocation

open "https://appstoreconnect.apple.com/apps/6471416156/distribution"
