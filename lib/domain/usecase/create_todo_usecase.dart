import '../model/todo.dart';

abstract class CreateTodoUseCase {
  Future<Todo> execute(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  );
}
