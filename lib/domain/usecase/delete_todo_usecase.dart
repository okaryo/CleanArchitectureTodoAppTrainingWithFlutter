import '../model/todo_id.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(final TodoId id);
}
