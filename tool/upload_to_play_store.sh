#!/bin/bash
set -euxo pipefail

package=$1

fastlane supply \
  --package_name "$package" \
  --aab packages/"$package"/build/app/outputs/bundle/prodRelease/app-prod-release.aab \
  --skip_upload_apk true \
  --skip_upload_metadata true \
  --skip_upload_changelogs true \
  --skip_upload_images true \
  --skip_upload_screenshots true \
  --release_status draft \
  --track alpha
