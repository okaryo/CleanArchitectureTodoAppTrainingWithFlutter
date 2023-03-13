import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/todos_impl.dart';
import '../repository/todos.dart';
import 'delete_todo.dart';

part 'delete_todo_impl.g.dart';

@riverpod
class DeleteTodoUseCaseImpl extends _$DeleteTodoUseCaseImpl
    implements DeleteTodoUseCase {
  @override
  Future<void> build(final int id) {
    final TodosRepository repository =
        ref.read(todosRepositoryImplProvider.notifier);
    return repository.deleteTodo(id);
  }
}
