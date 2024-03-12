#!/bin/bash
set -euo pipefail

# このスクリプトは、指定されたパッケージのリリース手順の一部を自動化します。
#
# e.g.
# ./release_app.sh listen_to_music_by_location

git fetch --all
git checkout main
git pull origin main

TARGET_PACKAGE=$1

melos run clean --no-select &&
    melos run pub:get &&
    melos run check

# 対象のパッケージのバージョン番号を上げ、Pull Requestを作成します
# Auto Mergeが有効です
grind bump --package="$TARGET_PACKAGE" --patch --create-pr

# Pull Requestがマージされるのを待ちます
grind wait-merge-pull-request

# GitHub Releasesに新しいリリースをdraftで作成し、そのbodyを[release.md]にdumpします
# openコマンドで[release.md]を開くので、Release Notesを人力で書きます
# 手動でReleaseに変更を加えて公開します
grind create-new-release --package="$TARGET_PACKAGE"

# リリースノートが書かれるのを待ちます
while true; do
    read -r -p "Did you write the release note? (y/n): " CONT
    if [ "$CONT" = "y" ]; then
        echo "Continuing..."
        break
    else
        echo ""
        echo "Please write the release note and then answer 'y'."
    fi
done

# Release Notesを含めたメタデータを各ストアに配信します
grind deliver-store-metadata --package="$TARGET_PACKAGE"

# TODO: 複数アプリの場合はどうする？
# melos run build:ipa:prod:upload
# melos run build:appbundle:prod:upload
