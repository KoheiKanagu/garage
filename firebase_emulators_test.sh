#!/bin/bash
set -euxo pipefail

firebase use dev --debug

npm --prefix firebase/functions ci
npm --prefix firebase/functions run clean
npm --prefix firebase/functions run compile

firebase emulators:exec \
    --only auth,functions,firestore \
    --import firebase/testdata \
    "npm --prefix firebase/functions run test"
