import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository repository = MockTodosRepository();
  final DeleteTodoUseCase usecase = DeleteTodoUseCaseImpl(repository);

  setUp(() {
    when(repository.deleteTodo(const TodoId(value: 1))).thenAnswer((_) async => {});
  });

  test('should return void', () async {
    await usecase.execute(const TodoId(value: 1));
    verify(repository.deleteTodo(const TodoId(value: 1))).called(1);
  });
}
