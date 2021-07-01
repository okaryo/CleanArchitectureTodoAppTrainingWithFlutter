abstract class CreateTodoUseCase {
  Future<void> execute(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  );
}
