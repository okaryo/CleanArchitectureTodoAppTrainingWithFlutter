// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_todo_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateTodoUseCaseImplHash() =>
    r'1f0f1cbafa2f68e4213753a8e5a9c70e4fb98f86';

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

abstract class _$UpdateTodoUseCaseImpl
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int id;
  late final String title;
  late final String? description;
  late final bool isCompleted;
  late final DateTime dueDate;

  Future<void> build(
    int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  });
}

/// See also [UpdateTodoUseCaseImpl].
@ProviderFor(UpdateTodoUseCaseImpl)
const updateTodoUseCaseImplProvider = UpdateTodoUseCaseImplFamily();

/// See also [UpdateTodoUseCaseImpl].
class UpdateTodoUseCaseImplFamily extends Family<AsyncValue<void>> {
  /// See also [UpdateTodoUseCaseImpl].
  const UpdateTodoUseCaseImplFamily();

  /// See also [UpdateTodoUseCaseImpl].
  UpdateTodoUseCaseImplProvider call(
    int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  }) {
    return UpdateTodoUseCaseImplProvider(
      id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      dueDate: dueDate,
    );
  }

  @override
  UpdateTodoUseCaseImplProvider getProviderOverride(
    covariant UpdateTodoUseCaseImplProvider provider,
  ) {
    return call(
      provider.id,
      title: provider.title,
      description: provider.description,
      isCompleted: provider.isCompleted,
      dueDate: provider.dueDate,
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
  String? get name => r'updateTodoUseCaseImplProvider';
}

/// See also [UpdateTodoUseCaseImpl].
class UpdateTodoUseCaseImplProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UpdateTodoUseCaseImpl, void> {
  /// See also [UpdateTodoUseCaseImpl].
  UpdateTodoUseCaseImplProvider(
    this.id, {
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.dueDate,
  }) : super.internal(
          () => UpdateTodoUseCaseImpl()
            ..id = id
            ..title = title
            ..description = description
            ..isCompleted = isCompleted
            ..dueDate = dueDate,
          from: updateTodoUseCaseImplProvider,
          name: r'updateTodoUseCaseImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateTodoUseCaseImplHash,
          dependencies: UpdateTodoUseCaseImplFamily._dependencies,
          allTransitiveDependencies:
              UpdateTodoUseCaseImplFamily._allTransitiveDependencies,
        );

  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime dueDate;

  @override
  bool operator ==(Object other) {
    return other is UpdateTodoUseCaseImplProvider &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, description.hashCode);
    hash = _SystemHash.combine(hash, isCompleted.hashCode);
    hash = _SystemHash.combine(hash, dueDate.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<void> runNotifierBuild(
    covariant UpdateTodoUseCaseImpl notifier,
  ) {
    return notifier.build(
      id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      dueDate: dueDate,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
