import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';

class DeleteTodoUseCaseImpl implements DeleteTodoUseCase {
  final TodosRepository _repository;

  const DeleteTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(TodoId id) => _repository.deleteTodo(id);
}
