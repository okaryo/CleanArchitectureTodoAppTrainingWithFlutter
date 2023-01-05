import 'package:clean_architecture_todo_app/data/repository/todos_repository_impl.dart';
import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/data/datasource/database/todos_database_mock.mocks.dart';

void main() {
  final database = MockTodosDatabase();
  final TodosRepository repository = TodosRepositoryImpl(database);
  final date = DateTime.now();

  group('#getTodoList', () {
    setUp(() {
      when(database.allTodos()).thenAnswer((_) async => [
            {
              'id': 1,
              'title': 'title',
              'description': 'description',
              'is_completed': 0,
              'due_date': date.toIso8601String(),
            },
          ]);
    });

    test('should return TodoList', () async {
      final actual = await repository.getTodoList();
      final expected = TodoList(
        values: [
          Todo(
            id: const TodoId(value: 1),
            title: 'title',
            description: 'description',
            isCompleted: false,
            dueDate: date,
          ),
        ],
      );
      expect(actual.values.first.id, expected.values.first.id);
      verify(database.allTodos()).called(1);
    });
  });

  group('#createTodo', () {
    setUp(() {
      when(database.insertTodo(
        {
          'id': null,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': date.toIso8601String(),
        },
      )).thenAnswer(
        (_) async => {
          'id': 1,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': date.toIso8601String(),
        },
      );
    });

    test('should return void', () async {
      await repository.createTodo('title', 'description', false, date);
      verify(database.insertTodo(
        {
          'id': null,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': date.toIso8601String(),
        },
      )).called(1);
    });
  });

  group('#updateTodo', () {
    setUp(() {
      when(database.updateTodo(
        {
          'id': 1,
          'title': 'new title',
          'description': 'new description',
          'is_completed': 1,
          'due_date': date.toIso8601String(),
        },
      )).thenAnswer((_) async => {});
    });

    test('should return void', () async {
      await repository.updateTodo(const TodoId(value: 1), 'new title', 'new description', true, date);
      verify(database.updateTodo(
        {
          'id': 1,
          'title': 'new title',
          'description': 'new description',
          'is_completed': 1,
          'due_date': date.toIso8601String(),
        },
      )).called(1);
    });
  });

  group('#deleteTodo', () {
    setUp(() {
      when(database.deleteTodo(1)).thenAnswer((_) async => {});
    });

    test('should return void', () async {
      await repository.deleteTodo(const TodoId(value: 1));
      verify(database.deleteTodo(1)).called(1);
    });
  });
}
