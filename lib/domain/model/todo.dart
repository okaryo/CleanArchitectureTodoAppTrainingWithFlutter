import 'todo_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TodoId id,
    required String title,
    required String description,
    required bool isCompleted,
    required DateTime dueDate,
  }) = _Todo;

  const Todo._();

  Todo complete() => copyWith(isCompleted: true);

  Todo incomplete() => copyWith(isCompleted: false);
}
