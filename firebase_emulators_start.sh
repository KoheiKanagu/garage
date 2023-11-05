#!/bin/bash
set -euxo pipefail

npm --prefix firebase/functions install --also=dev
npm --prefix firebase/functions run build:watch >/dev/null 2>&1 &

firebase use dev

firebase emulators:start \
    --only auth,functions,firestore \
    --import firebase/testdata \
    --export-on-exit \
    --inspect-functions

trap "kill 0" SIGINT
