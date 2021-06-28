// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoListStateTearOff {
  const _$TodoListStateTearOff();

  _TodoListStateCompleted completed(TodoList todoList) {
    return _TodoListStateCompleted(
      todoList,
    );
  }

  _TodoListStateLoading loading() {
    return const _TodoListStateLoading();
  }

  _TodoListStateError error(Exception exception) {
    return _TodoListStateError(
      exception,
    );
  }
}

/// @nodoc
const $TodoListState = _$TodoListStateTearOff();

/// @nodoc
mixin _$TodoListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoList todoList) completed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoList todoList)? completed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateCompleted value) completed,
    required TResult Function(_TodoListStateLoading value) loading,
    required TResult Function(_TodoListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateCompleted value)? completed,
    TResult Function(_TodoListStateLoading value)? loading,
    TResult Function(_TodoListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;
}

/// @nodoc
abstract class _$TodoListStateCompletedCopyWith<$Res> {
  factory _$TodoListStateCompletedCopyWith(_TodoListStateCompleted value,
          $Res Function(_TodoListStateCompleted) then) =
      __$TodoListStateCompletedCopyWithImpl<$Res>;
  $Res call({TodoList todoList});

  $TodoListCopyWith<$Res> get todoList;
}

/// @nodoc
class __$TodoListStateCompletedCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateCompletedCopyWith<$Res> {
  __$TodoListStateCompletedCopyWithImpl(_TodoListStateCompleted _value,
      $Res Function(_TodoListStateCompleted) _then)
      : super(_value, (v) => _then(v as _TodoListStateCompleted));

  @override
  _TodoListStateCompleted get _value => super._value as _TodoListStateCompleted;

  @override
  $Res call({
    Object? todoList = freezed,
  }) {
    return _then(_TodoListStateCompleted(
      todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as TodoList,
    ));
  }

  @override
  $TodoListCopyWith<$Res> get todoList {
    return $TodoListCopyWith<$Res>(_value.todoList, (value) {
      return _then(_value.copyWith(todoList: value));
    });
  }
}

/// @nodoc

class _$_TodoListStateCompleted implements _TodoListStateCompleted {
  const _$_TodoListStateCompleted(this.todoList);

  @override
  final TodoList todoList;

  @override
  String toString() {
    return 'TodoListState.completed(todoList: $todoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoListStateCompleted &&
            (identical(other.todoList, todoList) ||
                const DeepCollectionEquality()
                    .equals(other.todoList, todoList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todoList);

  @JsonKey(ignore: true)
  @override
  _$TodoListStateCompletedCopyWith<_TodoListStateCompleted> get copyWith =>
      __$TodoListStateCompletedCopyWithImpl<_TodoListStateCompleted>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoList todoList) completed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return completed(todoList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoList todoList)? completed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(todoList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateCompleted value) completed,
    required TResult Function(_TodoListStateLoading value) loading,
    required TResult Function(_TodoListStateError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateCompleted value)? completed,
    TResult Function(_TodoListStateLoading value)? loading,
    TResult Function(_TodoListStateError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateCompleted implements TodoListState {
  const factory _TodoListStateCompleted(TodoList todoList) =
      _$_TodoListStateCompleted;

  TodoList get todoList => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TodoListStateCompletedCopyWith<_TodoListStateCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TodoListStateLoadingCopyWith<$Res> {
  factory _$TodoListStateLoadingCopyWith(_TodoListStateLoading value,
          $Res Function(_TodoListStateLoading) then) =
      __$TodoListStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TodoListStateLoadingCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateLoadingCopyWith<$Res> {
  __$TodoListStateLoadingCopyWithImpl(
      _TodoListStateLoading _value, $Res Function(_TodoListStateLoading) _then)
      : super(_value, (v) => _then(v as _TodoListStateLoading));

  @override
  _TodoListStateLoading get _value => super._value as _TodoListStateLoading;
}

/// @nodoc

class _$_TodoListStateLoading implements _TodoListStateLoading {
  const _$_TodoListStateLoading();

  @override
  String toString() {
    return 'TodoListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TodoListStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoList todoList) completed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoList todoList)? completed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateCompleted value) completed,
    required TResult Function(_TodoListStateLoading value) loading,
    required TResult Function(_TodoListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateCompleted value)? completed,
    TResult Function(_TodoListStateLoading value)? loading,
    TResult Function(_TodoListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateLoading implements TodoListState {
  const factory _TodoListStateLoading() = _$_TodoListStateLoading;
}

/// @nodoc
abstract class _$TodoListStateErrorCopyWith<$Res> {
  factory _$TodoListStateErrorCopyWith(
          _TodoListStateError value, $Res Function(_TodoListStateError) then) =
      __$TodoListStateErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$TodoListStateErrorCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateErrorCopyWith<$Res> {
  __$TodoListStateErrorCopyWithImpl(
      _TodoListStateError _value, $Res Function(_TodoListStateError) _then)
      : super(_value, (v) => _then(v as _TodoListStateError));

  @override
  _TodoListStateError get _value => super._value as _TodoListStateError;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_TodoListStateError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_TodoListStateError implements _TodoListStateError {
  const _$_TodoListStateError(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'TodoListState.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoListStateError &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  _$TodoListStateErrorCopyWith<_TodoListStateError> get copyWith =>
      __$TodoListStateErrorCopyWithImpl<_TodoListStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TodoList todoList) completed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TodoList todoList)? completed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TodoListStateCompleted value) completed,
    required TResult Function(_TodoListStateLoading value) loading,
    required TResult Function(_TodoListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TodoListStateCompleted value)? completed,
    TResult Function(_TodoListStateLoading value)? loading,
    TResult Function(_TodoListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _TodoListStateError implements TodoListState {
  const factory _TodoListStateError(Exception exception) =
      _$_TodoListStateError;

  Exception get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TodoListStateErrorCopyWith<_TodoListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
