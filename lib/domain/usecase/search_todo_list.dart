import '../model/todo.dart';

abstract class SearchTodoListUseCase {
  Future<List<Todo>> build(String query);
}
