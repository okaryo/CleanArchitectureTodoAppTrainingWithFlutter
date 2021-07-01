import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';

class CreateTodoUseCaseImpl implements CreateTodoUseCase {
  final TodosRepository _repository;

  const CreateTodoUseCaseImpl(this._repository);

  @override
  Future<void> execute(
    String title,
    String description,
    bool isCompleted,
    DateTime dueDate,
  ) {
    return _repository.createTodo(title, description, isCompleted, dueDate);
  }
}
