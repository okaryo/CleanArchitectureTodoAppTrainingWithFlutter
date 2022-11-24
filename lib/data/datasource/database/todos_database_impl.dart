import 'todos_database.dart';
import '../../entity/todos_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodosDatabaseImpl implements TodosDatabase {
  static const _databaseName = 'todos_database';
  static const _tableName = 'todos_table';
  static const _databaseVersion = 1;
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnDescription = 'description';
  static const _columnIsCompleted = 'is_completed';
  static const _columnDueDate = 'due_date';
  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<TodoListEntity> allTodos() async {
    final db = await database;
    return db.query(_tableName);
  }

  @override
  Future<TodoEntity> insertTodo(final TodoEntity todo) async {
    final db = await database;
    late final TodoEntity todoEntity;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _tableName,
        todo,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results = await txn.query(_tableName, where: '$_columnId = ?', whereArgs: [id]);
      todoEntity = results.first;
    });
    return todoEntity;
  }

  @override
  Future<void> updateTodo(final TodoEntity todo) async {
    final db = await database;
    final int id = todo['id'];
    await db.update(
      _tableName,
      todo,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> deleteTodo(final int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: '$_columnId = ?',
      whereArgs: [id],
    );
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_tableName(
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_columnTitle TEXT NOT NULL,
            $_columnDescription TEXT,
            $_columnIsCompleted INTEGER NOT NULL,
            $_columnDueDate TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }
}
