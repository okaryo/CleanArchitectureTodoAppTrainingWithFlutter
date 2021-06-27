import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'delete_todo_usecase_test.mocks.dart';

@GenerateMocks([TodosRepository])
void main() {
  final TodosRepository _repository = MockTodosRepository();
  final DeleteTodoUseCase _usecase = DeleteTodoUseCaseImpl(_repository);

  setUp(() {
    when(_repository.deleteTodo(const TodoId(value: 1)))
        .thenAnswer((_) async => null);
  });

  test('should return void', () async {
    await _usecase.execute(const TodoId(value: 1));
    verify(_repository.deleteTodo(const TodoId(value: 1))).called(1);
  });
}
