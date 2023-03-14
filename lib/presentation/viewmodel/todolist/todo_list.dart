import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/todo.dart';
import '../../../domain/usecase/create_todo_impl.dart';
import '../../../domain/usecase/delete_completed_todos_impl.dart';
import '../../../domain/usecase/delete_todo_impl.dart';
import '../../../domain/usecase/get_todo_list_impl.dart';
import '../../../domain/usecase/update_todo_impl.dart';

import 'filter_kind.dart';

part 'todo_list.g.dart';

@riverpod
class TodoListViewModel extends _$TodoListViewModel {
  void completeTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    updateTodo(newTodo);
  }

  void undoTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    updateTodo(newTodo);
  }

  Future<void> deleteCompletedTodos() async {
    return ref.read(deleteCompletedTodosUseCaseImplProvider);
  }

  @override
  Future<List<Todo>> build() async {
    final todos = ref.watch(getTodoListUseCaseImplProvider).valueOrNull;
    if (todos == null) return [];
    final filterKind = ref.watch(filterKindProvider);
    switch (filterKind) {
      case FilterKind.all:
        return todos;
      case FilterKind.completed:
        return todos.filterByCompleted();
      case FilterKind.incomplete:
        return todos.filterByIncomplete();
    }
  }

  Future<void> addTodo(
    final String title,
    final String? description,
    final bool isCompleted,
    final DateTime dueDate,
  ) async {
    return ref.watch(createTodoUseCaseImplProvider(
      title,
      description,
      isCompleted,
      dueDate,
    ).future);
  }

  Future<void> updateTodo(Todo newTodo) async {
    return ref.watch(updateTodoUseCaseImplProvider(
      newTodo.id,
      title: newTodo.title,
      description: newTodo.description,
      isCompleted: newTodo.isCompleted,
      dueDate: newTodo.dueDate,
    ).future);
  }

  Future<void> deleteTodo(final int id) async {
    return ref.watch(deleteTodoUseCaseImplProvider(id).future);
  }
}
