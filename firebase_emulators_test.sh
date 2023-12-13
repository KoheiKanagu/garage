#!/bin/bash
set -euxo pipefail

if [ "$1" == "prod" ]; then
    echo "Running in prod mode"
    firebase use prod --debug
else
    echo "Running in dev mode"
    firebase use dev --debug
fi

npm --prefix firebase/functions ci
npm --prefix firebase/functions run clean

firebase emulators:exec \
    --debug \
    --only auth,functions,firestore \
    --import firebase/testdata \
    "npm --prefix firebase/functions run test"
