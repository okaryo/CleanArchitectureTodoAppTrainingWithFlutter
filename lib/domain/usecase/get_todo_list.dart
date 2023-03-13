import '../model/todo.dart';

abstract class GetTodoListUseCase {
  Future<List<Todo>> build();
}
