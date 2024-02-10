import 'dart:io';

import 'package:core/core.dart';

Uri? storeUri({
  required String packageName,
}) {
  if (Platform.isIOS || Platform.isMacOS) {
    return Uri.parse('https://apps.apple.com/app/id$kAppStoreId');
  }

  if (Platform.isAndroid) {
    return Uri.parse(
      'https://play.google.com/store/apps/details?id=$packageName',
    );
  }

  return null;
}
