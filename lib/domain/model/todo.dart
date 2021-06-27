import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required TodoId id,
    required String title,
    required String description,
    required bool isCompleted,
    required DateTime date,
  }) = _Todo;
}
