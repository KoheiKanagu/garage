#!/bin/bash
set -euo pipefail

if [ "$1" = "dev" ]; then
    APP_ID=$(jq -r '.flutter.platforms.android.buildConfigurations."src/dev".appId' firebase.json)
elif [ "$1" = "prod" ]; then
    APP_ID=$(jq -r '.flutter.platforms.android.buildConfigurations."src/prod".appId' firebase.json)
else
    echo "Invalid argument: $1"
    exit 1
fi

firebase crashlytics:symbols:upload \
    --app "$APP_ID" \
    build/app/outputs/app.android-*.symbols
