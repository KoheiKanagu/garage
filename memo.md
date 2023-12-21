# 備忘録

## 新しくアプリを追加する時の手順

### Firebase Authentication

- Identity Platform で新しくテナントを作ってプロバイダを設定する

<https://console.cloud.google.com/customer-identity/tenants?project=kingu-garage-dev>
<https://console.cloud.google.com/customer-identity/tenants?project=kingu-garage-prod>

### Firestore

- Identity Platform で作ったテナント ID から末尾のランダムな文字列を除いたものをデータベース名として作成する

```sh
# テナントIDが foo-1234567890 の場合
database=loca-music

firebase use prod
firebase firestore:databases:create $database \
    --location=asia-northeast1 \
    --delete-protection ENABLED

firebase use dev
firebase firestore:databases:create $database \
    --location=asia-northeast1 \
    --delete-protection ENABLED
```

### Flutterfire

[tool/flutterfire_configure.dart](tool/flutterfire_configure.dart) を修正

```sh
grind flutterfire-configure
```

- セキュリティルールを設定する

[firebase.json](firebase.json)

### [garage.code-workspace](garage.code-workspace)

- `folders`に追加
- `jest.disabledWorkspaceFolders`に追加
- `conventionalCommits.scopes`に追加

### iOS

```sh
NEW_PACKAGE=foo

cp packages/listen_to_music_by_location/configs/AdHocExportOptions.plist packages/$NEW_PACKAGE/configs/
cp packages/listen_to_music_by_location/configs/AppStoreExportOptions.plist packages/$NEW_PACKAGE/configs/
```

`provisioningProfiles`を修正

### Remote Config

[remoteconfig.template.json](remoteconfig.template.json) の conditions に追記

### chore

```sh
NEW_PACKAGE=foo

cp packages/core/analysis_options.yaml packages/$NEW_PACKAGE/
(cd packages/$NEW_PACKAGE && ln -s ../core/build.yaml .)

cp packages/listen_to_music_by_location/lib/main_dev.dart packages/$NEW_PACKAGE/lib/
cp packages/listen_to_music_by_location/lib/main_prod.dart packages/$NEW_PACKAGE/lib/
cp packages/listen_to_music_by_location/lib/my_app.dart packages/$NEW_PACKAGE/lib/
cp packages/listen_to_music_by_location/lib/my_go_router.dart packages/$NEW_PACKAGE/lib/

touch packages/$NEW_PACKAGE/lib/features/home/application/home_route.dart
touch packages/$NEW_PACKAGE/lib/features/home/presentation/home_page.dart
```

## リリース手順

```sh
grind bump --package=listen_to_music_by_location --patch
gh pr create --fill --assignee @me
# WIP
# gh release create --generate-notes foo-v1.0.0+1
```

Build Archive

```sh
melos run clean --no-select
melos run build:ipa:prod:upload
melos run build:appbundle:prod:upload
```
