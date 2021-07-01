import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[] operator', () {
    group('when index value is valid', () {
      test('should return specified todo', () {
        final actual = TodoList(values: [
          _buildTodo(0),
          _buildTodo(1),
          _buildTodo(2),
          _buildTodo(3),
        ])[2];
        final expected = _buildTodo(2);
        expect(actual, expected);
      });
    });

    group('when index value is invalid', () {
      test('should throw exception', () {
        final todoList = TodoList(values: [
          _buildTodo(0),
          _buildTodo(1),
          _buildTodo(2),
          _buildTodo(3),
        ]);
        expect(() => todoList[4], throwsRangeError);
      });
    });
  });

  group('length getter', () {
    group('when todo list is empty', () {
      test('should return 0', () {
        final actual = const TodoList(values: []).length;
        expect(actual, 0);
      });
    });

    group('when todo list is not empty', () {
      test('should return 2', () {
        final actual = TodoList(values: [
          _buildTodo(1),
          _buildTodo(2),
        ]).length;
        expect(actual, 2);
      });
    });
  });
}

Todo _buildTodo(final int id) {
  return Todo(
    id: TodoId(value: id),
    title: 'title$id',
    description: 'description$id',
    isCompleted: false,
    dueDate: DateTime.parse('2021-07-01'),
  );
}
