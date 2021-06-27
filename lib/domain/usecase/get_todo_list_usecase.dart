import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';

abstract class GetTodoListUseCase {
  Future<TodoList> execute();
}
