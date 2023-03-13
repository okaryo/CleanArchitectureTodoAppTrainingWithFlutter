// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createTodoUseCaseImplHash() =>
    r'a6bf59f1e034cc3ea10c4aed8efcb3a8270f41a2';

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

abstract class _$CreateTodoUseCaseImpl
    extends BuildlessAutoDisposeAsyncNotifier<Todo> {
  late final String title;
  late final String? description;
  late final bool isCompleted;
  late final DateTime dueDate;

  Future<Todo> build(
    String title,
    String? description,
    bool isCompleted,
    DateTime dueDate,
  );
}

/// See also [CreateTodoUseCaseImpl].
@ProviderFor(CreateTodoUseCaseImpl)
const createTodoUseCaseImplProvider = CreateTodoUseCaseImplFamily();

/// See also [CreateTodoUseCaseImpl].
class CreateTodoUseCaseImplFamily extends Family<AsyncValue<Todo>> {
  /// See also [CreateTodoUseCaseImpl].
  const CreateTodoUseCaseImplFamily();

  /// See also [CreateTodoUseCaseImpl].
  CreateTodoUseCaseImplProvider call(
    String title,
    String? description,
    bool isCompleted,
    DateTime dueDate,
  ) {
    return CreateTodoUseCaseImplProvider(
      title,
      description,
      isCompleted,
      dueDate,
    );
  }

  @override
  CreateTodoUseCaseImplProvider getProviderOverride(
    covariant CreateTodoUseCaseImplProvider provider,
  ) {
    return call(
      provider.title,
      provider.description,
      provider.isCompleted,
      provider.dueDate,
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
  String? get name => r'createTodoUseCaseImplProvider';
}

/// See also [CreateTodoUseCaseImpl].
class CreateTodoUseCaseImplProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CreateTodoUseCaseImpl, Todo> {
  /// See also [CreateTodoUseCaseImpl].
  CreateTodoUseCaseImplProvider(
    this.title,
    this.description,
    this.isCompleted,
    this.dueDate,
  ) : super.internal(
          () => CreateTodoUseCaseImpl()
            ..title = title
            ..description = description
            ..isCompleted = isCompleted
            ..dueDate = dueDate,
          from: createTodoUseCaseImplProvider,
          name: r'createTodoUseCaseImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createTodoUseCaseImplHash,
          dependencies: CreateTodoUseCaseImplFamily._dependencies,
          allTransitiveDependencies:
              CreateTodoUseCaseImplFamily._allTransitiveDependencies,
        );

  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime dueDate;

  @override
  bool operator ==(Object other) {
    return other is CreateTodoUseCaseImplProvider &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, isCompleted.hashCode);
    hash = _SystemHash.combine(hash, dueDate.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<Todo> runNotifierBuild(
    covariant CreateTodoUseCaseImpl notifier,
  ) {
    return notifier.build(
      title,
      description,
      isCompleted,
      dueDate,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
