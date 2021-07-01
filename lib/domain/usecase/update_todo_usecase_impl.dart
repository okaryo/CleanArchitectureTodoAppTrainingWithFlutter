import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';

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
