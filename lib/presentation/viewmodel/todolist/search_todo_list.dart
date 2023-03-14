import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repository/todos_impl.dart';
import '../../../domain/model/todo.dart';

part 'search_todo_list.g.dart';

@riverpod
class SearchTodoListViewModel extends _$SearchTodoListViewModel {
  @override
  Future<List<Todo>> build(String query) async {
    final model = ref.watch(todosRepositoryImplProvider.notifier);
    return model.searchTodos(query);
  }
}
