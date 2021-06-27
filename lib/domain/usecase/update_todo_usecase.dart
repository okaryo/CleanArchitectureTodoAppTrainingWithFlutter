import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';

abstract class UpdateTodoUseCase {
  Future<void> execute(
    final TodoId id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime date,
  );
}
