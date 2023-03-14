import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/todos_impl.dart';
import '../repository/todos.dart';
import 'delete_completed_todos.dart';

part 'delete_completed_todos_impl.g.dart';

@riverpod
class DeleteCompletedTodosUseCaseImpl extends _$DeleteCompletedTodosUseCaseImpl implements DeleteCompletedTodosUseCase {
  @override
  Future<void> build() {
    final TodosRepository repository = ref.read(todosRepositoryImplProvider.notifier);
    return repository.deleteAllCompleted();
  }
}
