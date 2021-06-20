import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';

abstract class TodosRepository {
  Future<TodoList> getTodoList();
  Future<void> deleteTodo();
}
