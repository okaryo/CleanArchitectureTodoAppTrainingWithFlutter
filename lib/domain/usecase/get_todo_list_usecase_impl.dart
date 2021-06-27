import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';

class GetTodoListUseCaseImpl implements GetTodoListUseCase {
  final TodosRepository _repository;

  const GetTodoListUseCaseImpl(this._repository);

  @override
  Future<TodoList> execute() => _repository.getTodoList();
}
