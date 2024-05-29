#!/bin/bash
set -euxo pipefail

echo "MELOS_SDK_PATH=$FLUTTER_ROOT" >>"$GITHUB_ENV"

dart pub global activate melos
dart pub global activate grinder
dart pub global activate flutterfire_cli
