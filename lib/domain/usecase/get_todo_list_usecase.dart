import '../model/todo_list.dart';

abstract class GetTodoListUseCase {
  Future<TodoList> execute();
}
