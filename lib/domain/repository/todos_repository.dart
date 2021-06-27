import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';

abstract class TodosRepository {
  Future<TodoList> getTodoList();
  Future<void> createTodo(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime date,
  );
  Future<void> updateTodo(
    final int id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime date,
  );
  Future<void> deleteTodo(final int id);
}
