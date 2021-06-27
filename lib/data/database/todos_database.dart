import 'package:clean_architecture_todo_app/data/entity/todos_entity.dart';

abstract class TodosDatabase {
  Future<List<Map<String, dynamic>>> allTodos();
  Future<void> insertTodo(final TodoEntity todoEntity);
  Future<void> updateTodo(final TodoEntity todoEntity);
  Future<void> deleteTodo(final int id);
}
