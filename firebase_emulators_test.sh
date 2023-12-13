#!/bin/bash
set -euxo pipefail

firebase use dev --debug

npm --prefix firebase/functions ci
npm --prefix firebase/functions run clean

firebase emulators:exec \
    --debug \
    --only auth,functions,firestore \
    --import firebase/testdata \
    "npm --prefix firebase/functions run test"
