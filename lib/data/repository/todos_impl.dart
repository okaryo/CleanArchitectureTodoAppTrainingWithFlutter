import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/todo.dart';
import '../../domain/repository/todos.dart';
import '../mapper/todo.dart';
import '../source/database/database.dart';
import '../source/database/database_impl.dart' as db;

part 'todos_impl.g.dart';

@riverpod
class TodosRepositoryImpl extends _$TodosRepositoryImpl implements TodosRepository {
  late final Database database = ref.read(db.databaseProvider);

  @override
  Stream<List<Todo>> build() {
    return database.watchTodos().map(TodoMapper.transformToModelList);
  }

  @override
  Future<void> deleteAllCompleted() {
    return database.deleteCompletedTodos();
  }

  @override
  Future<List<Todo>> searchTodos(String query) async {
    if (query.isEmpty) return [];
    // Full text search
    return database.searchTodos(query).then(TodoMapper.transformToModelList);
  }

  @override
  Future<Todo> createTodo({
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  }) async {
    final model = await database.insertTodo(db.TodosCompanion.insert(
      title: title,
      isCompleted: isCompleted ? 1 : 0,
      dueDate: dueDate.toIso8601String(),
    ));

    return TodoMapper.transformToModel(model);
  }

  @override
  Future<void> updateTodo(
    int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  }) async {
    await database.updateTodo(
      id,
      db.TodosCompanion(
        title: db.Val(title),
        isCompleted: db.Val(isCompleted ? 1 : 0),
        dueDate: db.Val(dueDate.toIso8601String()),
      ),
    );
  }

  @override
  Future<void> deleteTodo(int id) async {
    await database.deleteTodo(id);
  }
}
