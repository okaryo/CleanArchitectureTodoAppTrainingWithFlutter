// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_todo_list_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchTodoListUseCaseImplHash() =>
    r'2aa3b39467c6430702759eca0efdc0dff87928dd';

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

abstract class _$SearchTodoListUseCaseImpl
    extends BuildlessAutoDisposeAsyncNotifier<List<Todo>> {
  late final String query;

  Future<List<Todo>> build(
    String query,
  );
}

/// See also [SearchTodoListUseCaseImpl].
@ProviderFor(SearchTodoListUseCaseImpl)
const searchTodoListUseCaseImplProvider = SearchTodoListUseCaseImplFamily();

/// See also [SearchTodoListUseCaseImpl].
class SearchTodoListUseCaseImplFamily extends Family<AsyncValue<List<Todo>>> {
  /// See also [SearchTodoListUseCaseImpl].
  const SearchTodoListUseCaseImplFamily();

  /// See also [SearchTodoListUseCaseImpl].
  SearchTodoListUseCaseImplProvider call(
    String query,
  ) {
    return SearchTodoListUseCaseImplProvider(
      query,
    );
  }

  @override
  SearchTodoListUseCaseImplProvider getProviderOverride(
    covariant SearchTodoListUseCaseImplProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchTodoListUseCaseImplProvider';
}

/// See also [SearchTodoListUseCaseImpl].
class SearchTodoListUseCaseImplProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchTodoListUseCaseImpl,
        List<Todo>> {
  /// See also [SearchTodoListUseCaseImpl].
  SearchTodoListUseCaseImplProvider(
    this.query,
  ) : super.internal(
          () => SearchTodoListUseCaseImpl()..query = query,
          from: searchTodoListUseCaseImplProvider,
          name: r'searchTodoListUseCaseImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchTodoListUseCaseImplHash,
          dependencies: SearchTodoListUseCaseImplFamily._dependencies,
          allTransitiveDependencies:
              SearchTodoListUseCaseImplFamily._allTransitiveDependencies,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchTodoListUseCaseImplProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Todo>> runNotifierBuild(
    covariant SearchTodoListUseCaseImpl notifier,
  ) {
    return notifier.build(
      query,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
