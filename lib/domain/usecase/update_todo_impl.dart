import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/todos_impl.dart';
import '../repository/todos.dart';
import 'update_todo.dart';

part 'update_todo_impl.g.dart';

@riverpod
class UpdateTodoUseCaseImpl extends _$UpdateTodoUseCaseImpl
    implements UpdateTodoUseCase {
  @override
  Future<void> build(
    final int id, {
    required String title,
    required String? description,
    required bool isCompleted,
    required DateTime dueDate,
  }) {
    final TodosRepository repository =
        ref.read(todosRepositoryImplProvider.notifier);
    return repository.updateTodo(
      id,
      title: title,
      description: description,
      isCompleted: isCompleted,
      dueDate: dueDate,
    );
  }
}
