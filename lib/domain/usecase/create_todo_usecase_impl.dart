import '../model/todo.dart';
import '../repository/todos_repository.dart';
import 'create_todo_usecase.dart';

class CreateTodoUseCaseImpl implements CreateTodoUseCase {
  final TodosRepository _repository;

  const CreateTodoUseCaseImpl(this._repository);

  @override
  Future<Todo> execute(
    String title,
    String description,
    bool isCompleted,
    DateTime dueDate,
  ) {
    return _repository.createTodo(title, description, isCompleted, dueDate);
  }
}
