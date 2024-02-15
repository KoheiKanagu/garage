import 'package:grinder/grinder.dart';

export 'bump.dart';
export 'bump_all_deps.dart';
export 'create_new_release.dart';
export 'deliver_store_metadata.dart';
export 'dump_firestore_indexes.dart';
export 'flutterfire_configure.dart';
export 'replace_remoteconfig_template_conditions.dart';
export 'update_core_export.dart';
export 'update_coverage_test.dart';
export 'update_si.dart';

void main(List<String> args) {
  grind(args);
}
