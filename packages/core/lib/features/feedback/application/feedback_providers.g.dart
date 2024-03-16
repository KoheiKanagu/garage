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
    r'4edfe71dd0e5d0f0cd3a774b7902dc5133a81d3b';

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
String _$feedbackCommentCollectionReferenceHash() =>
    r'350481bab794d4ec49843d48cb0f36299abc40e4';

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

/// See also [feedbackCommentCollectionReference].
@ProviderFor(feedbackCommentCollectionReference)
const feedbackCommentCollectionReferenceProvider =
    FeedbackCommentCollectionReferenceFamily();

/// See also [feedbackCommentCollectionReference].
class FeedbackCommentCollectionReferenceFamily
    extends Family<CollectionReference<FeedbackComment>> {
  /// See also [feedbackCommentCollectionReference].
  const FeedbackCommentCollectionReferenceFamily();

  /// See also [feedbackCommentCollectionReference].
  FeedbackCommentCollectionReferenceProvider call(
    String feedbackId,
  ) {
    return FeedbackCommentCollectionReferenceProvider(
      feedbackId,
    );
  }

  @override
  FeedbackCommentCollectionReferenceProvider getProviderOverride(
    covariant FeedbackCommentCollectionReferenceProvider provider,
  ) {
    return call(
      provider.feedbackId,
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
  String? get name => r'feedbackCommentCollectionReferenceProvider';
}

/// See also [feedbackCommentCollectionReference].
class FeedbackCommentCollectionReferenceProvider
    extends AutoDisposeProvider<CollectionReference<FeedbackComment>> {
  /// See also [feedbackCommentCollectionReference].
  FeedbackCommentCollectionReferenceProvider(
    String feedbackId,
  ) : this._internal(
          (ref) => feedbackCommentCollectionReference(
            ref as FeedbackCommentCollectionReferenceRef,
            feedbackId,
          ),
          from: feedbackCommentCollectionReferenceProvider,
          name: r'feedbackCommentCollectionReferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackCommentCollectionReferenceHash,
          dependencies: FeedbackCommentCollectionReferenceFamily._dependencies,
          allTransitiveDependencies: FeedbackCommentCollectionReferenceFamily
              ._allTransitiveDependencies,
          feedbackId: feedbackId,
        );

  FeedbackCommentCollectionReferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.feedbackId,
  }) : super.internal();

  final String feedbackId;

  @override
  Override overrideWith(
    CollectionReference<FeedbackComment> Function(
            FeedbackCommentCollectionReferenceRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackCommentCollectionReferenceProvider._internal(
        (ref) => create(ref as FeedbackCommentCollectionReferenceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        feedbackId: feedbackId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CollectionReference<FeedbackComment>>
      createElement() {
    return _FeedbackCommentCollectionReferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackCommentCollectionReferenceProvider &&
        other.feedbackId == feedbackId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, feedbackId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackCommentCollectionReferenceRef
    on AutoDisposeProviderRef<CollectionReference<FeedbackComment>> {
  /// The parameter `feedbackId` of this provider.
  String get feedbackId;
}

class _FeedbackCommentCollectionReferenceProviderElement
    extends AutoDisposeProviderElement<CollectionReference<FeedbackComment>>
    with FeedbackCommentCollectionReferenceRef {
  _FeedbackCommentCollectionReferenceProviderElement(super.provider);

  @override
  String get feedbackId =>
      (origin as FeedbackCommentCollectionReferenceProvider).feedbackId;
}

String _$feedbackSubmitHash() => r'9dec40983841d7aa0f0186ab6e4df025ef2d208f';

/// See also [feedbackSubmit].
@ProviderFor(feedbackSubmit)
const feedbackSubmitProvider = FeedbackSubmitFamily();

/// See also [feedbackSubmit].
class FeedbackSubmitFamily extends Family<AsyncValue<void>> {
  /// See also [feedbackSubmit].
  const FeedbackSubmitFamily();

  /// See also [feedbackSubmit].
  FeedbackSubmitProvider call(
    UserFeedback userFeedback, {
    required FeedbackFrom feedbackFrom,
  }) {
    return FeedbackSubmitProvider(
      userFeedback,
      feedbackFrom: feedbackFrom,
    );
  }

  @override
  FeedbackSubmitProvider getProviderOverride(
    covariant FeedbackSubmitProvider provider,
  ) {
    return call(
      provider.userFeedback,
      feedbackFrom: provider.feedbackFrom,
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
    UserFeedback userFeedback, {
    required FeedbackFrom feedbackFrom,
  }) : this._internal(
          (ref) => feedbackSubmit(
            ref as FeedbackSubmitRef,
            userFeedback,
            feedbackFrom: feedbackFrom,
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
          feedbackFrom: feedbackFrom,
        );

  FeedbackSubmitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userFeedback,
    required this.feedbackFrom,
  }) : super.internal();

  final UserFeedback userFeedback;
  final FeedbackFrom feedbackFrom;

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
        feedbackFrom: feedbackFrom,
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
        other.userFeedback == userFeedback &&
        other.feedbackFrom == feedbackFrom;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userFeedback.hashCode);
    hash = _SystemHash.combine(hash, feedbackFrom.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackSubmitRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `userFeedback` of this provider.
  UserFeedback get userFeedback;

  /// The parameter `feedbackFrom` of this provider.
  FeedbackFrom get feedbackFrom;
}

class _FeedbackSubmitProviderElement
    extends AutoDisposeFutureProviderElement<void> with FeedbackSubmitRef {
  _FeedbackSubmitProviderElement(super.provider);

  @override
  UserFeedback get userFeedback =>
      (origin as FeedbackSubmitProvider).userFeedback;
  @override
  FeedbackFrom get feedbackFrom =>
      (origin as FeedbackSubmitProvider).feedbackFrom;
}

String _$feedbackDataStateHash() => r'a6721a33e284a41cdd9f4bb61fe34236af944fb7';

/// See also [feedbackDataState].
@ProviderFor(feedbackDataState)
final feedbackDataStateProvider =
    AutoDisposeFutureProvider<FeedbackData>.internal(
  feedbackDataState,
  name: r'feedbackDataStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackDataStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeedbackDataStateRef = AutoDisposeFutureProviderRef<FeedbackData>;
String _$feedbackCommentStateHash() =>
    r'f10261379876df7fdd0ecfa1ab36e3a9d4df1e37';

/// See also [feedbackCommentState].
@ProviderFor(feedbackCommentState)
final feedbackCommentStateProvider =
    AutoDisposeFutureProvider<FeedbackComment>.internal(
  feedbackCommentState,
  name: r'feedbackCommentStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackCommentStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FeedbackCommentStateRef = AutoDisposeFutureProviderRef<FeedbackComment>;
String _$feedbackValidateEmailHash() =>
    r'ea215e29fd22e1f727630b999061126de814d264';

/// See also [feedbackValidateEmail].
@ProviderFor(feedbackValidateEmail)
const feedbackValidateEmailProvider = FeedbackValidateEmailFamily();

/// See also [feedbackValidateEmail].
class FeedbackValidateEmailFamily extends Family<String?> {
  /// See also [feedbackValidateEmail].
  const FeedbackValidateEmailFamily();

  /// See also [feedbackValidateEmail].
  FeedbackValidateEmailProvider call({
    required String? value,
    required String errorMessage,
  }) {
    return FeedbackValidateEmailProvider(
      value: value,
      errorMessage: errorMessage,
    );
  }

  @override
  FeedbackValidateEmailProvider getProviderOverride(
    covariant FeedbackValidateEmailProvider provider,
  ) {
    return call(
      value: provider.value,
      errorMessage: provider.errorMessage,
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
  String? get name => r'feedbackValidateEmailProvider';
}

/// See also [feedbackValidateEmail].
class FeedbackValidateEmailProvider extends AutoDisposeProvider<String?> {
  /// See also [feedbackValidateEmail].
  FeedbackValidateEmailProvider({
    required String? value,
    required String errorMessage,
  }) : this._internal(
          (ref) => feedbackValidateEmail(
            ref as FeedbackValidateEmailRef,
            value: value,
            errorMessage: errorMessage,
          ),
          from: feedbackValidateEmailProvider,
          name: r'feedbackValidateEmailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackValidateEmailHash,
          dependencies: FeedbackValidateEmailFamily._dependencies,
          allTransitiveDependencies:
              FeedbackValidateEmailFamily._allTransitiveDependencies,
          value: value,
          errorMessage: errorMessage,
        );

  FeedbackValidateEmailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
    required this.errorMessage,
  }) : super.internal();

  final String? value;
  final String errorMessage;

  @override
  Override overrideWith(
    String? Function(FeedbackValidateEmailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackValidateEmailProvider._internal(
        (ref) => create(ref as FeedbackValidateEmailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
        errorMessage: errorMessage,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String?> createElement() {
    return _FeedbackValidateEmailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackValidateEmailProvider &&
        other.value == value &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);
    hash = _SystemHash.combine(hash, errorMessage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackValidateEmailRef on AutoDisposeProviderRef<String?> {
  /// The parameter `value` of this provider.
  String? get value;

  /// The parameter `errorMessage` of this provider.
  String get errorMessage;
}

class _FeedbackValidateEmailProviderElement
    extends AutoDisposeProviderElement<String?> with FeedbackValidateEmailRef {
  _FeedbackValidateEmailProviderElement(super.provider);

  @override
  String? get value => (origin as FeedbackValidateEmailProvider).value;
  @override
  String get errorMessage =>
      (origin as FeedbackValidateEmailProvider).errorMessage;
}

String _$feedbackValidateMessageHash() =>
    r'17cfea53f73c74c0b5efeda0316f816192e96a8b';

/// See also [feedbackValidateMessage].
@ProviderFor(feedbackValidateMessage)
const feedbackValidateMessageProvider = FeedbackValidateMessageFamily();

/// See also [feedbackValidateMessage].
class FeedbackValidateMessageFamily extends Family<String?> {
  /// See also [feedbackValidateMessage].
  const FeedbackValidateMessageFamily();

  /// See also [feedbackValidateMessage].
  FeedbackValidateMessageProvider call({
    required String? value,
    required String errorMessage,
  }) {
    return FeedbackValidateMessageProvider(
      value: value,
      errorMessage: errorMessage,
    );
  }

  @override
  FeedbackValidateMessageProvider getProviderOverride(
    covariant FeedbackValidateMessageProvider provider,
  ) {
    return call(
      value: provider.value,
      errorMessage: provider.errorMessage,
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
  String? get name => r'feedbackValidateMessageProvider';
}

/// See also [feedbackValidateMessage].
class FeedbackValidateMessageProvider extends AutoDisposeProvider<String?> {
  /// See also [feedbackValidateMessage].
  FeedbackValidateMessageProvider({
    required String? value,
    required String errorMessage,
  }) : this._internal(
          (ref) => feedbackValidateMessage(
            ref as FeedbackValidateMessageRef,
            value: value,
            errorMessage: errorMessage,
          ),
          from: feedbackValidateMessageProvider,
          name: r'feedbackValidateMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackValidateMessageHash,
          dependencies: FeedbackValidateMessageFamily._dependencies,
          allTransitiveDependencies:
              FeedbackValidateMessageFamily._allTransitiveDependencies,
          value: value,
          errorMessage: errorMessage,
        );

  FeedbackValidateMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
    required this.errorMessage,
  }) : super.internal();

  final String? value;
  final String errorMessage;

  @override
  Override overrideWith(
    String? Function(FeedbackValidateMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedbackValidateMessageProvider._internal(
        (ref) => create(ref as FeedbackValidateMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
        errorMessage: errorMessage,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String?> createElement() {
    return _FeedbackValidateMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackValidateMessageProvider &&
        other.value == value &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);
    hash = _SystemHash.combine(hash, errorMessage.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedbackValidateMessageRef on AutoDisposeProviderRef<String?> {
  /// The parameter `value` of this provider.
  String? get value;

  /// The parameter `errorMessage` of this provider.
  String get errorMessage;
}

class _FeedbackValidateMessageProviderElement
    extends AutoDisposeProviderElement<String?>
    with FeedbackValidateMessageRef {
  _FeedbackValidateMessageProviderElement(super.provider);

  @override
  String? get value => (origin as FeedbackValidateMessageProvider).value;
  @override
  String get errorMessage =>
      (origin as FeedbackValidateMessageProvider).errorMessage;
}

String _$feedbackDataControllerHash() =>
    r'5f6e61b2f09da528f6f22e5470aa1d02bdeaac01';

/// See also [FeedbackDataController].
@ProviderFor(FeedbackDataController)
final feedbackDataControllerProvider = AutoDisposeAsyncNotifierProvider<
    FeedbackDataController, FeedbackData>.internal(
  FeedbackDataController.new,
  name: r'feedbackDataControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackDataControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FeedbackDataController = AutoDisposeAsyncNotifier<FeedbackData>;
String _$feedbackCommentControllerHash() =>
    r'fa2cba10c4853b5ec513c1da794559a3a78880f7';

/// See also [FeedbackCommentController].
@ProviderFor(FeedbackCommentController)
final feedbackCommentControllerProvider = AutoDisposeAsyncNotifierProvider<
    FeedbackCommentController, FeedbackComment>.internal(
  FeedbackCommentController.new,
  name: r'feedbackCommentControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$feedbackCommentControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FeedbackCommentController = AutoDisposeAsyncNotifier<FeedbackComment>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
