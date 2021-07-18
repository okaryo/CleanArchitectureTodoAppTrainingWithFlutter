import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';

abstract class TodosRepository {
  Future<TodoList> getTodoList();
  Future<Todo> createTodo(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  );
  Future<void> updateTodo(
    final TodoId id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  );
  Future<void> deleteTodo(final TodoId id);
}
