import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/todos_impl.dart';
import '../model/todo.dart';
import 'get_todo_list.dart';

part 'get_todo_list_impl.g.dart';

@riverpod
class GetTodoListUseCaseImpl extends _$GetTodoListUseCaseImpl implements GetTodoListUseCase {
  @override
  Future<List<Todo>> build() async {
    final repository = ref.watch(todosRepositoryImplProvider);
    return repository.valueOrNull ?? [];
  }
}
