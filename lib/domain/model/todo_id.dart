import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_id.freezed.dart';

@freezed
class TodoId with _$TodoId {
  const factory TodoId({required int value}) = _TodoId;
}
