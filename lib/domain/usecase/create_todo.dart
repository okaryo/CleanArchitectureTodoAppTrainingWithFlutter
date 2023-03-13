import '../model/todo.dart';

abstract class CreateTodoUseCase {
  Future<Todo> build(
    final String title,
    final String? description,
    final bool isCompleted,
    final DateTime dueDate,
  );
}
