import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository _repository = MockTodosRepository();
  final CreateTodoUseCase _usecase = CreateTodoUseCaseImpl(_repository);
  final _date = DateTime.now();
  final _todo = Todo(
    id: const TodoId(value: 1),
    title: 'title',
    description: 'description',
    isCompleted: false,
    dueDate: _date,
  );

  setUp(() {
    when(_repository.createTodo('title', 'description', false, _date)).thenAnswer((_) async => _todo);
  });

  test('should return Todo', () async {
    final expected = await _usecase.execute('title', 'description', false, _date);
    final actual = _todo;
    expect(expected, actual);
    verify(_repository.createTodo('title', 'description', false, _date));
  });
}
