// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StateTearOff {
  const _$StateTearOff();

  StateFixed<T> fixed<T>(T content) {
    return StateFixed<T>(
      content,
    );
  }

  StateLoading<T> loading<T>() {
    return StateLoading<T>();
  }

  StateError<T> error<T>(Exception exception) {
    return StateError<T>(
      exception,
    );
  }
}

/// @nodoc
const $State = _$StateTearOff();

/// @nodoc
mixin _$State<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T content) fixed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T content)? fixed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StateFixed<T> value) fixed,
    required TResult Function(StateLoading<T> value) loading,
    required TResult Function(StateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StateFixed<T> value)? fixed,
    TResult Function(StateLoading<T> value)? loading,
    TResult Function(StateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<T, $Res> {
  factory $StateCopyWith(State<T> value, $Res Function(State<T>) then) =
      _$StateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StateCopyWithImpl<T, $Res> implements $StateCopyWith<T, $Res> {
  _$StateCopyWithImpl(this._value, this._then);

  final State<T> _value;
  // ignore: unused_field
  final $Res Function(State<T>) _then;
}

/// @nodoc
abstract class $StateFixedCopyWith<T, $Res> {
  factory $StateFixedCopyWith(
          StateFixed<T> value, $Res Function(StateFixed<T>) then) =
      _$StateFixedCopyWithImpl<T, $Res>;
  $Res call({T content});
}

/// @nodoc
class _$StateFixedCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements $StateFixedCopyWith<T, $Res> {
  _$StateFixedCopyWithImpl(
      StateFixed<T> _value, $Res Function(StateFixed<T>) _then)
      : super(_value, (v) => _then(v as StateFixed<T>));

  @override
  StateFixed<T> get _value => super._value as StateFixed<T>;

  @override
  $Res call({
    Object? content = freezed,
  }) {
    return _then(StateFixed<T>(
      content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$StateFixed<T> implements StateFixed<T> {
  const _$StateFixed(this.content);

  @override
  final T content;

  @override
  String toString() {
    return 'State<$T>.fixed(content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StateFixed<T> &&
            (identical(other.content, content) ||
                const DeepCollectionEquality().equals(other.content, content)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(content);

  @JsonKey(ignore: true)
  @override
  $StateFixedCopyWith<T, StateFixed<T>> get copyWith =>
      _$StateFixedCopyWithImpl<T, StateFixed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T content) fixed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return fixed(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T content)? fixed,
    TResult Function()? loading,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StateFixed<T> value) fixed,
    required TResult Function(StateLoading<T> value) loading,
    required TResult Function(StateError<T> value) error,
  }) {
    return fixed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StateFixed<T> value)? fixed,
    TResult Function(StateLoading<T> value)? loading,
    TResult Function(StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (fixed != null) {
      return fixed(this);
    }
    return orElse();
  }
}

abstract class StateFixed<T> implements State<T> {
  const factory StateFixed(T content) = _$StateFixed<T>;

  T get content => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateFixedCopyWith<T, StateFixed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateLoadingCopyWith<T, $Res> {
  factory $StateLoadingCopyWith(
          StateLoading<T> value, $Res Function(StateLoading<T>) then) =
      _$StateLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$StateLoadingCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements $StateLoadingCopyWith<T, $Res> {
  _$StateLoadingCopyWithImpl(
      StateLoading<T> _value, $Res Function(StateLoading<T>) _then)
      : super(_value, (v) => _then(v as StateLoading<T>));

  @override
  StateLoading<T> get _value => super._value as StateLoading<T>;
}

/// @nodoc

class _$StateLoading<T> implements StateLoading<T> {
  const _$StateLoading();

  @override
  String toString() {
    return 'State<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is StateLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T content) fixed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T content)? fixed,
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
    required TResult Function(StateFixed<T> value) fixed,
    required TResult Function(StateLoading<T> value) loading,
    required TResult Function(StateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StateFixed<T> value)? fixed,
    TResult Function(StateLoading<T> value)? loading,
    TResult Function(StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StateLoading<T> implements State<T> {
  const factory StateLoading() = _$StateLoading<T>;
}

/// @nodoc
abstract class $StateErrorCopyWith<T, $Res> {
  factory $StateErrorCopyWith(
          StateError<T> value, $Res Function(StateError<T>) then) =
      _$StateErrorCopyWithImpl<T, $Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$StateErrorCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements $StateErrorCopyWith<T, $Res> {
  _$StateErrorCopyWithImpl(
      StateError<T> _value, $Res Function(StateError<T>) _then)
      : super(_value, (v) => _then(v as StateError<T>));

  @override
  StateError<T> get _value => super._value as StateError<T>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(StateError<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$StateError<T> implements StateError<T> {
  const _$StateError(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'State<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StateError<T> &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  $StateErrorCopyWith<T, StateError<T>> get copyWith =>
      _$StateErrorCopyWithImpl<T, StateError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T content) fixed,
    required TResult Function() loading,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T content)? fixed,
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
    required TResult Function(StateFixed<T> value) fixed,
    required TResult Function(StateLoading<T> value) loading,
    required TResult Function(StateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StateFixed<T> value)? fixed,
    TResult Function(StateLoading<T> value)? loading,
    TResult Function(StateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StateError<T> implements State<T> {
  const factory StateError(Exception exception) = _$StateError<T>;

  Exception get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateErrorCopyWith<T, StateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
