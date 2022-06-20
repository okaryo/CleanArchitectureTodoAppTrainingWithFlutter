import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

@freezed
class TodoList with _$TodoList {
  const factory TodoList({required List<Todo> values}) = _TodoList;

  const TodoList._();

  operator [](final int index) => values[index];

  int get length => values.length;

  TodoList addTodo(final Todo todo) => copyWith(values: [...values, todo]);

  TodoList updateTodo(final Todo newTodo) {
    return copyWith(values: values.map((todo) => newTodo.id == todo.id ? newTodo : todo).toList());
  }

  TodoList removeTodoById(final TodoId id) => copyWith(values: values.where((todo) => todo.id != id).toList());

  TodoList filterByCompleted() => copyWith(values: values.where((todo) => todo.isCompleted).toList());

  TodoList filterByIncomplete() => copyWith(values: values.where((todo) => !todo.isCompleted).toList());
}
