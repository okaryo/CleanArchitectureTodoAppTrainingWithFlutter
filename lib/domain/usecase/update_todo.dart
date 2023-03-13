abstract class UpdateTodoUseCase {
  Future<void> build(
    final int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  });
}
