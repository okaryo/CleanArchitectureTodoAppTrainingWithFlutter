// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_todo_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchTodoListViewModelHash() =>
    r'1287d8cd647c62f606ba1db7e56c545763cec7c9';

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

abstract class _$SearchTodoListViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<Todo>> {
  late final String query;

  Future<List<Todo>> build(
    String query,
  );
}

/// See also [SearchTodoListViewModel].
@ProviderFor(SearchTodoListViewModel)
const searchTodoListViewModelProvider = SearchTodoListViewModelFamily();

/// See also [SearchTodoListViewModel].
class SearchTodoListViewModelFamily extends Family<AsyncValue<List<Todo>>> {
  /// See also [SearchTodoListViewModel].
  const SearchTodoListViewModelFamily();

  /// See also [SearchTodoListViewModel].
  SearchTodoListViewModelProvider call(
    String query,
  ) {
    return SearchTodoListViewModelProvider(
      query,
    );
  }

  @override
  SearchTodoListViewModelProvider getProviderOverride(
    covariant SearchTodoListViewModelProvider provider,
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
  String? get name => r'searchTodoListViewModelProvider';
}

/// See also [SearchTodoListViewModel].
class SearchTodoListViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SearchTodoListViewModel,
        List<Todo>> {
  /// See also [SearchTodoListViewModel].
  SearchTodoListViewModelProvider(
    this.query,
  ) : super.internal(
          () => SearchTodoListViewModel()..query = query,
          from: searchTodoListViewModelProvider,
          name: r'searchTodoListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchTodoListViewModelHash,
          dependencies: SearchTodoListViewModelFamily._dependencies,
          allTransitiveDependencies:
              SearchTodoListViewModelFamily._allTransitiveDependencies,
        );

  final String query;

  @override
  bool operator ==(Object other) {
    return other is SearchTodoListViewModelProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Todo>> runNotifierBuild(
    covariant SearchTodoListViewModel notifier,
  ) {
    return notifier.build(
      query,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
