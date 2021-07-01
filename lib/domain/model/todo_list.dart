import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

@freezed
class TodoList with _$TodoList {
  const factory TodoList({required List<Todo> values}) = _TodoList;

  const TodoList._();

  operator [](final int index) => values[index];

  int get length => values.length;
}
