import 'database_impl.dart';

abstract class Database {
  Future<List<Todo>> searchTodos(String query);
  Future<List<Todo>> getTodos();
  Stream<List<Todo>> watchTodos();
  Future<Todo> insertTodo(TodosCompanion todo);
  Future<void> updateTodo(int id, TodosCompanion todo);
  Future<void> deleteTodo(int id);
  Future<Todo?> getTodo(int id);
  Future<void> deleteCompletedTodos();
  Future<void> deleteAllTodos();
}
