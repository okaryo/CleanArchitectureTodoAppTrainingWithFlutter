import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository _repository = MockTodosRepository();
  final _date = DateTime.now();
  final GetTodoListUseCase _usecase = GetTodoListUseCaseImpl(_repository);

  setUp(() {
    when(_repository.getTodoList()).thenAnswer(
      (_) async => TodoList(
        values: [
          Todo(
            id: const TodoId(value: 1),
            title: 'title',
            description: 'description',
            isCompleted: false,
            dueDate: _date,
          ),
        ],
      ),
    );
  });

  test('should return TodoList', () async {
    final expected = TodoList(
      values: [
        Todo(
            id: const TodoId(value: 1), title: 'title', description: 'description', isCompleted: false, dueDate: _date),
      ],
    );
    final actual = await _usecase.execute();
    expect(expected, actual);
    verify(_repository.getTodoList()).called(1);
  });
}
