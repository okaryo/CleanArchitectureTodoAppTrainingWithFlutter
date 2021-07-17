import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class State<T> with _$State<T> {
  const factory State.fixed(final T content) = StateFixed<T>;

  const factory State.loading() = StateLoading;

  const factory State.error(final Exception exception) = StateError;
}
