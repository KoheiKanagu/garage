#!/bin/bash
set -euxo pipefail

firebase use dev --debug

npm --prefix firebase/functions install --include=dev
npm --prefix firebase/functions run compile:watch >/dev/null 2>&1 &

firebase emulators:start \
    --only auth,functions,firestore \
    --import firebase/testdata \
    --export-on-exit \
    --inspect-functions

trap "kill 0" SIGINT
