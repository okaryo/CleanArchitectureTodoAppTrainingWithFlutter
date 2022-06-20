import 'package:clean_architecture_todo_app/data/repository/todos_repository_impl.dart';
import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/data/datasource/database/todos_database_mock.mocks.dart';

void main() {
  final _database = MockTodosDatabase();
  final TodosRepository _repository = TodosRepositoryImpl(_database);
  final _date = DateTime.now();

  group('getTodoList', () {
    setUp(() {
      when(_database.allTodos()).thenAnswer((_) async => [
            {
              'id': 1,
              'title': 'title',
              'description': 'description',
              'is_completed': 0,
              'due_date': _date.toIso8601String(),
            },
          ]);
    });

    test('should return TodoList', () async {
      final actual = await _repository.getTodoList();
      final expected = TodoList(
        values: [
          Todo(
            id: const TodoId(value: 1),
            title: 'title',
            description: 'description',
            isCompleted: false,
            dueDate: _date,
          ),
        ],
      );
      expect(actual.values.first.id, expected.values.first.id);
      verify(_database.allTodos()).called(1);
    });
  });

  group('createTodo', () {
    setUp(() {
      when(_database.insertTodo(
        {
          'id': 0,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': _date.toIso8601String(),
        },
      )).thenAnswer(
        (_) async => {
          'id': 1,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': _date.toIso8601String(),
        },
      );
    });

    test('should return void', () async {
      await _repository.createTodo('title', 'description', false, _date);
      verify(_database.insertTodo(
        {
          'id': 0,
          'title': 'title',
          'description': 'description',
          'is_completed': 0,
          'due_date': _date.toIso8601String(),
        },
      )).called(1);
    });
  });

  group('updateTodo', () {
    setUp(() {
      when(_database.updateTodo(
        {
          'id': 1,
          'title': 'new title',
          'description': 'new description',
          'is_completed': 1,
          'due_date': _date.toIso8601String(),
        },
      )).thenAnswer((_) async => {});
    });

    test('should return void', () async {
      await _repository.updateTodo(const TodoId(value: 1), 'new title', 'new description', true, _date);
      verify(_database.updateTodo(
        {
          'id': 1,
          'title': 'new title',
          'description': 'new description',
          'is_completed': 1,
          'due_date': _date.toIso8601String(),
        },
      )).called(1);
    });
  });

  group('deleteTodo', () {
    setUp(() {
      when(_database.deleteTodo(1)).thenAnswer((_) async => {});
    });

    test('should return void', () async {
      await _repository.deleteTodo(const TodoId(value: 1));
      verify(_database.deleteTodo(1)).called(1);
    });
  });
}
