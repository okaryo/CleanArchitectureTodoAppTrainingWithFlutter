import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository _repository = MockTodosRepository();
  final UpdateTodoUseCase _usecase = UpdateTodoUseCaseImpl(_repository);
  final _date = DateTime.now();

  setUp(() {
    when(_repository.updateTodo(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      _date,
    )).thenAnswer((_) async => null);
  });

  test('should return void', () async {
    await _usecase.execute(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      _date,
    );
    verify(_repository.updateTodo(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      _date,
    )).called(1);
  });
}
