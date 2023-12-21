// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas, non_constant_identifier_names, cast_nullable_to_non_nullable, lines_longer_than_80_chars, unnecessary_null_checks, strict_raw_type

part of 'feedback_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbackDeviceInfoHash() =>
    r'bdf0b424cc7e97c8fc4846564d2db2434b218658';

/// See also [feedbackDeviceInfo].
@ProviderFor(feedbackDeviceInfo)
final feedbackDeviceInfoProvider =
    AutoDisposeFutureProvider<FeedbackDeviceInfo>.internal(
  feedbackDeviceInfo,
  name: r'feedbackDeviceInfoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackDeviceInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeedbackDeviceInfoRef
    = AutoDisposeFutureProviderRef<FeedbackDeviceInfo>;
String _$feedbackCollectionReferenceHash() =>
    r'c50f657af048830e0166541032576cd735df2cb8';

/// See also [feedbackCollectionReference].
@ProviderFor(feedbackCollectionReference)
final feedbackCollectionReferenceProvider =
    AutoDisposeProvider<CollectionReference<FeedbackData>>.internal(
  feedbackCollectionReference,
  name: r'feedbackCollectionReferenceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackCollectionReferenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeedbackCollectionReferenceRef
    = AutoDisposeProviderRef<CollectionReference<FeedbackData>>;
String _$feedbackSubmitHash() => r'ca1a760ba55d6d31dd014220a09ffab77dd5b36f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [feedbackSubmit].
@ProviderFor(feedbackSubmit)
const feedbackSubmitProvider = FeedbackSubmitFamily();

/// See also [feedbackSubmit].
class FeedbackSubmitFamily extends Family<AsyncValue<void>> {
  /// See also [feedbackSubmit].
  const FeedbackSubmitFamily();

  /// See also [feedbackSubmit].
  FeedbackSubmitProvider call(
    UserFeedback userFeedback,
  ) {
    return FeedbackSubmitProvider(
      userFeedback,
    );
  }

  @override
  FeedbackSubmitProvider getProviderOverride(
    covariant FeedbackSubmitProvider provider,
  ) {
    return call(
      provider.userFeedback,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedbackSubmitProvider';
}

/// See also [feedbackSubmit].
class FeedbackSubmitProvider extends AutoDisposeFutureProvider<void> {
  /// See also [feedbackSubmit].
  FeedbackSubmitProvider(
    UserFeedback userFeedback,
  ) : this._internal(
          (ref) => feedbackSubmit(
            ref as FeedbackSubmitRef,
            userFeedback,
          ),
          from: feedbackSubmitProvider,
          name: r'feedbackSubmitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackSubmitHash,
          dependencies: FeedbackSubmitFamily._dependencies,
          allTransitiveDependencies:
              FeedbackSubmitFamily._allTransitiveDependencies,
          userFeedback: userFeedback,
        );

  FeedbackSubmitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userFeedback,
  }) : super.internal();

  final UserFeedback userFeedback;

  @override
  Override overrideWith(
    FutureOr<void> Function(FeedbackSubmitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackSubmitProvider._internal(
        (ref) => create(ref as FeedbackSubmitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userFeedback: userFeedback,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FeedbackSubmitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackSubmitProvider &&
        other.userFeedback == userFeedback;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userFeedback.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackSubmitRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userFeedback` of this provider.
  UserFeedback get userFeedback;
}

class _FeedbackSubmitProviderElement
    extends AutoDisposeFutureProviderElement<void> with FeedbackSubmitRef {
  _FeedbackSubmitProviderElement(super.provider);

  @override
  UserFeedback get userFeedback =>
      (origin as FeedbackSubmitProvider).userFeedback;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
