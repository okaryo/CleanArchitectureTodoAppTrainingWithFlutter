import 'package:clean_architecture_todo_app/data/datasource/database/todos_database.dart';
import 'package:clean_architecture_todo_app/data/mapper/todo_list_mapper.dart';
import 'package:clean_architecture_todo_app/data/mapper/todo_mapper.dart';
import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosDatabase database;

  const TodosRepositoryImpl(this.database);

  @override
  Future<TodoList> getTodoList() async {
    final todoListEntity = await database.allTodos();
    return TodoListMapper.transformToModel(todoListEntity);
  }

  @override
  Future<Todo> createTodo(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  ) async {
    final todoEntity = await database.insertTodo(TodoMapper.transformToNewEntityMap(
      title,
      description,
      isCompleted,
      dueDate,
    ));
    return TodoMapper.transformToModel(todoEntity);
  }

  @override
  Future<void> updateTodo(
    final TodoId id,
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  ) async {
    final todo = Todo(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      dueDate: dueDate,
    );
    await database.updateTodo(TodoMapper.transformToMap(todo));
  }

  @override
  Future<void> deleteTodo(final TodoId id) async => await database.deleteTodo(id.value);
}
