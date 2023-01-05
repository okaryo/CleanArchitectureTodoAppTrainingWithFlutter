import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository repository = MockTodosRepository();
  final UpdateTodoUseCase usecase = UpdateTodoUseCaseImpl(repository);
  final date = DateTime.now();

  setUp(() {
    when(repository.updateTodo(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      date,
    )).thenAnswer((_) async => {});
  });

  test('should return void', () async {
    await usecase.execute(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      date,
    );
    verify(repository.updateTodo(
      const TodoId(value: 1),
      'title',
      'description',
      true,
      date,
    )).called(1);
  });
}
