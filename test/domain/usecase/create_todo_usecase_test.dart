import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/todos_repository_mock.mocks.dart';

void main() {
  final TodosRepository _repository = MockTodosRepository();
  final CreateTodoUseCase _usecase = CreateTodoUseCaseImpl(_repository);
  final _date = DateTime.now();

  setUp(() {
    when(_repository.createTodo('title', 'description', false, _date)).thenAnswer((_) async => null);
  });

  test('should return void', () async {
    await _usecase.execute('title', 'description', false, _date);
    verify(_repository.createTodo('title', 'description', false, _date));
  });
}
