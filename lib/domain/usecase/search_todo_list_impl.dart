import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/todos_impl.dart';
import '../model/todo.dart';
import 'search_todo_list.dart';

part 'search_todo_list_impl.g.dart';

@riverpod
class SearchTodoListUseCaseImpl extends _$SearchTodoListUseCaseImpl implements SearchTodoListUseCase {
  @override
  Future<List<Todo>> build(String query) async {
    final model = ref.watch(todosRepositoryImplProvider.notifier);
    return model.searchTodos(query);
  }
}
