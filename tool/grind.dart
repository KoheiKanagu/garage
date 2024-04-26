import 'package:grinder/grinder.dart';

export 'bump_all_deps.dart';
export 'create_new_releases.dart';
export 'dart_format_all.dart';
export 'deliver_store_metadata.dart';
export 'download_app_privacy_details.dart';
export 'dump_firestore_indexes.dart';
export 'flutterfire_configure.dart';
export 'replace_remoteconfig_template_conditions.dart';
export 'update_core_export.dart';
export 'update_coverage_test.dart';
export 'update_si.dart';
export 'upload_app_privacy_details.dart';
export 'upload_release_notes.dart';

void main(List<String> args) {
  grind(args);
}
