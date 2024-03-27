#!/bin/bash
set -euxo pipefail

firebase use dev --debug

npm --prefix firebase/functions ci
npm --prefix firebase/functions run clean
npm --prefix firebase/functions run compile

# @swc/jestを使っているのでjsにコンパイルする必要はない。
# むしろ、コンパイルすると external-account-credential.ts で指定している相対パスが崩れるので
# 削除する。
npm --prefix firebase/functions run clean

firebase emulators:exec \
    --only auth,functions,firestore \
    --import firebase/testdata \
    "npm --prefix firebase/functions run test"
