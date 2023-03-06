// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'c62213bddb9aac89c0a19fe034ef243e2a285ba8';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$tmdbClientHash() => r'6d7c13e4a0d5cf312c1fd786fbe8c85202b98020';

/// See also [tmdbClient].
@ProviderFor(tmdbClient)
final tmdbClientProvider = AutoDisposeProvider<TmdbClient>.internal(
  tmdbClient,
  name: r'tmdbClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tmdbClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TmdbClientRef = AutoDisposeProviderRef<TmdbClient>;
String _$repositoryHash() => r'4078ec851ca15bb384fe3c46a2cc140d62abb1bf';

/// See also [repository].
@ProviderFor(repository)
final repositoryProvider = AutoDisposeProvider<Repository>.internal(
  repository,
  name: r'repositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$repositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepositoryRef = AutoDisposeProviderRef<Repository>;
String _$getMoviesHash() => r'93e76b455a9b710c96d800aa1325600856bef7d5';

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

typedef GetMoviesRef = AutoDisposeFutureProviderRef<List<MovieModel>>;

/// See also [getMovies].
@ProviderFor(getMovies)
const getMoviesProvider = GetMoviesFamily();

/// See also [getMovies].
class GetMoviesFamily extends Family<AsyncValue<List<MovieModel>>> {
  /// See also [getMovies].
  const GetMoviesFamily();

  /// See also [getMovies].
  GetMoviesProvider call(
    TrendType type,
    BuildContext context,
  ) {
    return GetMoviesProvider(
      type,
      context,
    );
  }

  @override
  GetMoviesProvider getProviderOverride(
    covariant GetMoviesProvider provider,
  ) {
    return call(
      provider.type,
      provider.context,
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
  String? get name => r'getMoviesProvider';
}

/// See also [getMovies].
class GetMoviesProvider extends AutoDisposeFutureProvider<List<MovieModel>> {
  /// See also [getMovies].
  GetMoviesProvider(
    this.type,
    this.context,
  ) : super.internal(
          (ref) => getMovies(
            ref,
            type,
            context,
          ),
          from: getMoviesProvider,
          name: r'getMoviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMoviesHash,
          dependencies: GetMoviesFamily._dependencies,
          allTransitiveDependencies: GetMoviesFamily._allTransitiveDependencies,
        );

  final TrendType type;
  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is GetMoviesProvider &&
        other.type == type &&
        other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
