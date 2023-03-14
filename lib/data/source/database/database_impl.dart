import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'connection/connection.dart' as impl;
import 'database.dart';

part 'database_impl.g.dart';

typedef Val<T> = Value<T>;

final databaseProvider = Provider<Database>(
  (ref) => DatabaseImpl(
    dbName: 'database.db',
    inMemory: false,
    logStatements: false,
  ),
);

@DriftDatabase(include: {'sql/schema.drift'})
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl({
    required this.dbName,
    required this.inMemory,
    required this.logStatements,
  }) : super.connect(impl.connect(
          dbName,
          inMemory: inMemory,
          logStatements: logStatements,
        ));

  final String dbName;
  final bool inMemory;
  final bool logStatements;

  @override
  int get schemaVersion => 1;

  @override
  Stream<List<Todo>> watchTodos() => _getTodos().watch();

  @override
  Future<List<Todo>> getTodos() => _getTodos().get();

  @override
  Future<Todo?> getTodo(int id) => _getTodoById(id).getSingleOrNull();

  @override
  Future<void> deleteTodo(int id) => _deleteTodo(id);

  @override
  Future<Todo> insertTodo(TodosCompanion todo) async {
    final id = await _insertTodo(
      todo.title.value,
      todo.description.value,
      todo.isCompleted.value,
      todo.dueDate.value,
    );
    return _getTodoById(id).getSingle();
  }

  @override
  Future<void> updateTodo(int id, TodosCompanion todo) async {
    return transaction(() {
      return _updateTodo(
        todo.title.value,
        todo.description.value,
        todo.isCompleted.value,
        todo.dueDate.value,
        id,
      );
    });
  }

  @override
  Future<void> deleteCompletedTodos() {
    return transaction(() {
      return _deleteCompletedTodos();
    });
  }

  @override
  Future<void> deleteAllTodos() {
    return transaction(() {
      return _deleteAllTodos();
    });
  }

  @override
  Future<List<Todo>> searchTodos(String query) {
    return _searchTodos(query).get().then((value) => value.map((e) => e.result).toList());
  }
}
