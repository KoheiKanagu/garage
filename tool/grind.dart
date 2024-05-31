import 'package:grinder/grinder.dart';

export 'build_runner/dart_format_all.dart';
export 'build_runner/update_core_export.dart';
export 'build_runner/update_coverage_test.dart';
export 'build_runner/update_si.dart';
export 'deps/bump_all_deps.dart';
export 'firebase/dump_firestore_indexes.dart';
export 'firebase/flutterfire_configure.dart';
export 'releases/create_new_releases.dart';
export 'releases/initial_release.dart';
export 'releases/open_release_notes.dart';
export 'releases/post_x.dart';
export 'releases/post_x_initial_release.dart';
export 'store/deliver_store_metadata.dart';
export 'store/download_app_privacy_details.dart';
export 'store/upload_app_privacy_details.dart';

void main(List<String> args) {
  grind(args);
}
