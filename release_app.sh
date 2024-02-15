#!/bin/bash
set -euxo pipefail

# このスクリプトは、指定されたパッケージのリリース手順の一部を自動化します。
#
# e.g.
# ./release_app.sh listen_to_music_by_location
#
# 何をやっているか
# 1. grind bump で対象のパッケージのバージョン番号を上げ、Pull Requestを作成します
# 2. 手動でPull Requestをマージします
# 3. GitHub Releasesに新しいリリースをdraftで作成します
# 4. 手動でRelease Notesを書いて公開します
# 5. grind deliver-store-metadata でRelease Notesを含めたメタデータを各ストアに配信します
# 6. ビルドのアーカイブ、アーカイブの各ストアアップロード、サブミットはこのスクリプトでは行いません。別で行います

TARGET_PACKAGE=$1

grind bump --package="$TARGET_PACKAGE" --patch --create-pr

read -r -p "Did you manually merge the pull request? (y/n): " CONT
if [ "$CONT" = "y" ]; then
    echo "Continuing..."
else
    echo "Aborted."
    exit 1
fi

grind create-new-release --package="$TARGET_PACKAGE"
read -r -p "Did you write the release note? (y/n): " CONT
if [ "$CONT" = "y" ]; then
    echo "Continuing..."
else
    echo "Aborted."
    exit 1
fi

grind deliver-store-metadata --package="$TARGET_PACKAGE"
