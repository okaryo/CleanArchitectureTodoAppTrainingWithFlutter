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

  _init<T> init<T>() {
    return _init<T>();
  }

  _loading<T> loading<T>() {
    return _loading<T>();
  }

  _success<T> success<T>(T data) {
    return _success<T>(
      data,
    );
  }

  _error<T> error<T>(Exception exception) {
    return _error<T>(
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
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init<T> value)? init,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
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
abstract class _$initCopyWith<T, $Res> {
  factory _$initCopyWith(_init<T> value, $Res Function(_init<T>) then) =
      __$initCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$initCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$initCopyWith<T, $Res> {
  __$initCopyWithImpl(_init<T> _value, $Res Function(_init<T>) _then)
      : super(_value, (v) => _then(v as _init<T>));

  @override
  _init<T> get _value => super._value as _init<T>;
}

/// @nodoc

class _$_init<T> extends _init<T> {
  const _$_init() : super._();

  @override
  String toString() {
    return 'State<$T>.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _init<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Exception exception) error,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init<T> value)? init,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _init<T> extends State<T> {
  const factory _init() = _$_init<T>;
  const _init._() : super._();
}

/// @nodoc
abstract class _$loadingCopyWith<T, $Res> {
  factory _$loadingCopyWith(
          _loading<T> value, $Res Function(_loading<T>) then) =
      __$loadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$loadingCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$loadingCopyWith<T, $Res> {
  __$loadingCopyWithImpl(_loading<T> _value, $Res Function(_loading<T>) _then)
      : super(_value, (v) => _then(v as _loading<T>));

  @override
  _loading<T> get _value => super._value as _loading<T>;
}

/// @nodoc

class _$_loading<T> extends _loading<T> {
  const _$_loading() : super._();

  @override
  String toString() {
    return 'State<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(T data)? success,
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
    required TResult Function(_init<T> value) init,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init<T> value)? init,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading<T> extends State<T> {
  const factory _loading() = _$_loading<T>;
  const _loading._() : super._();
}

/// @nodoc
abstract class _$successCopyWith<T, $Res> {
  factory _$successCopyWith(
          _success<T> value, $Res Function(_success<T>) then) =
      __$successCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$successCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$successCopyWith<T, $Res> {
  __$successCopyWithImpl(_success<T> _value, $Res Function(_success<T>) _then)
      : super(_value, (v) => _then(v as _success<T>));

  @override
  _success<T> get _value => super._value as _success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_success<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_success<T> extends _success<T> {
  const _$_success(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'State<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$successCopyWith<T, _success<T>> get copyWith =>
      __$successCopyWithImpl<T, _success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Exception exception) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init<T> value) init,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init<T> value)? init,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _success<T> extends State<T> {
  const factory _success(T data) = _$_success<T>;
  const _success._() : super._();

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$successCopyWith<T, _success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$errorCopyWith<T, $Res> {
  factory _$errorCopyWith(_error<T> value, $Res Function(_error<T>) then) =
      __$errorCopyWithImpl<T, $Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$errorCopyWithImpl<T, $Res> extends _$StateCopyWithImpl<T, $Res>
    implements _$errorCopyWith<T, $Res> {
  __$errorCopyWithImpl(_error<T> _value, $Res Function(_error<T>) _then)
      : super(_value, (v) => _then(v as _error<T>));

  @override
  _error<T> get _value => super._value as _error<T>;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_error<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_error<T> extends _error<T> {
  const _$_error(this.exception) : super._();

  @override
  final Exception exception;

  @override
  String toString() {
    return 'State<$T>.error(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _error<T> &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  _$errorCopyWith<T, _error<T>> get copyWith =>
      __$errorCopyWithImpl<T, _error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(T data)? success,
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
    required TResult Function(_init<T> value) init,
    required TResult Function(_loading<T> value) loading,
    required TResult Function(_success<T> value) success,
    required TResult Function(_error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init<T> value)? init,
    TResult Function(_loading<T> value)? loading,
    TResult Function(_success<T> value)? success,
    TResult Function(_error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error<T> extends State<T> {
  const factory _error(Exception exception) = _$_error<T>;
  const _error._() : super._();

  Exception get exception => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$errorCopyWith<T, _error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
