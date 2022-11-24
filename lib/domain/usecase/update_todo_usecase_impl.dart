import '../model/todo_id.dart';
import '../repository/todos_repository.dart';
import 'update_todo_usecase.dart';

class UpdateTodoUseCaseImpl implements UpdateTodoUseCase {
  final TodosRepository _repository;

  const UpdateTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(
    final TodoId id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  ) {
    return _repository.updateTodo(id, title, description, isCompleted, dueDate);
  }
}
