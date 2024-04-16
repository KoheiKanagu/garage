import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_go_router_listenable.freezed.dart';

@freezed
class MyGoRouterListenable with _$MyGoRouterListenable {
  const factory MyGoRouterListenable({
    @Default(false) bool signedIn,
    @Default(false) bool requiredUpdate,
    @Default(false) bool releasedNewVersion,
    @Default(Status.down) ServiceStatus serviceStatus,
  }) = _MyGoRouterListenable;
}
