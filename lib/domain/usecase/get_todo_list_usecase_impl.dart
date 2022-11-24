import '../model/todo_list.dart';
import '../repository/todos_repository.dart';
import 'get_todo_list_usecase.dart';

class GetTodoListUseCaseImpl implements GetTodoListUseCase {
  final TodosRepository _repository;

  const GetTodoListUseCaseImpl(this._repository);

  @override
  Future<TodoList> execute() => _repository.getTodoList();
}
