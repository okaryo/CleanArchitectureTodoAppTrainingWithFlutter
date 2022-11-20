import '../model/todo_id.dart';
import '../repository/todos_repository.dart';
import 'delete_todo_usecase.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodosRepository _repository;

  const DeleteTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(TodoId id) => _repository.deleteTodo(id);
}
