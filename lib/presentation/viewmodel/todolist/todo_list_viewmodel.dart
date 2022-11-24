import '../../../domain/domain_module.dart';
import '../../../domain/model/todo.dart';
import '../../../domain/model/todo_id.dart';
import '../../../domain/model/todo_list.dart';
import '../../../domain/usecase/create_todo_usecase.dart';
import '../../../domain/usecase/delete_todo_usecase.dart';
import '../../../domain/usecase/get_todo_list_usecase.dart';
import '../../../domain/usecase/update_todo_usecase.dart';
import '../../state/state.dart';
import 'filter_kind_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredTodoListProvider = Provider.autoDispose<State<TodoList>>((ref) {
  final filterKind = ref.watch(filterKindViewModelStateNotifierProvider);
  final todoListState = ref.watch(todoListViewModelStateNotifierProvider);

  return todoListState.when(
    init: () => const State.init(),
    success: (todoList) {
      switch (filterKind) {
        case FilterKind.all:
          return State.success(todoList);
        case FilterKind.completed:
          return State.success(todoList.filterByCompleted());
        case FilterKind.incomplete:
          return State.success(todoList.filterByIncomplete());
      }
    },
    loading: () => const State.loading(),
    error: (exception) => State.error(exception),
  );
});

final todoListViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<TodoListViewModel, State<TodoList>>(
  (ref) => TodoListViewModel(
    ref.watch(getTodoListUseCaseProvider),
    ref.watch(createTodoUseCaseProvider),
    ref.watch(updateTodoUseCaseProvider),
    ref.watch(deleteTodoUseCaseProvider),
  ),
);

class TodoListViewModel extends StateNotifier<State<TodoList>> {
  final GetTodoListUseCase _getTodoListUseCase;
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  TodoListViewModel(
    this._getTodoListUseCase,
    this._createTodoUseCase,
    this._updateTodoUseCase,
    this._deleteTodoUseCase,
  ) : super(const State.init()) {
    _getTodoList();
  }

  void completeTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    updateTodo(newTodo);
  }

  void undoTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    updateTodo(newTodo);
  }

  Future<void> _getTodoList() async {
    try {
      state = const State.loading();
      final todoList = await _getTodoListUseCase.execute();
      state = State.success(todoList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<void> addTodo(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  ) async {
    try {
      final newTodo = await _createTodoUseCase.execute(
        title,
        description,
        isCompleted,
        dueDate,
      );
      state = State.success(state.data!.addTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<void> updateTodo(final Todo newTodo) async {
    try {
      await _updateTodoUseCase.execute(
        newTodo.id,
        newTodo.title,
        newTodo.description,
        newTodo.isCompleted,
        newTodo.dueDate,
      );
      state = State.success(state.data!.updateTodo(newTodo));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  Future<void> deleteTodo(final TodoId id) async {
    try {
      await _deleteTodoUseCase.execute(id);
      state = State.success(state.data!.removeTodoById(id));
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
