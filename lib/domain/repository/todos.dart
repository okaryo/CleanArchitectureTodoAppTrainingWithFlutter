import '../model/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> searchTodos(String query);

  Future<Todo> createTodo({
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  });

  Future<void> updateTodo(
    final int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  });

  Future<void> deleteTodo(final int id);

  Future<void> deleteAllCompleted();
}
