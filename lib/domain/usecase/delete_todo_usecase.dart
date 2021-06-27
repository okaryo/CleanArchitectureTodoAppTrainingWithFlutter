import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(final TodoId id);
}
