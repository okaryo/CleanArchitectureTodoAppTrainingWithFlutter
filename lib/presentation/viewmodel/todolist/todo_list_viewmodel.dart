import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/state/filter_kind_state_controller.dart';
import 'package:clean_architecture_todo_app/presentation/state/state.dart';
import 'package:clean_architecture_todo_app/presentation/state/todo_list_state_controller.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/filter_kind.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoListViewModel {
  static TodoListViewModel? _instance;
  final TodoListStateController _todoListStateController;
  final FilterKindStateController _filterKindStateController;
  late final StateNotifierProvider<TodoListStateController, State<TodoList>> _todoListStateProvider;
  late final StateNotifierProvider<FilterKindStateController, FilterKind> _filterKindStateProvider;
  late final Provider<State<TodoList>> _filteredTodoListProvider;

  factory TodoListViewModel(
    final TodoListStateController todoListStateController,
    final FilterKindStateController filterKindStateController,
  ) {
    return _instance ??= TodoListViewModel._(todoListStateController, filterKindStateController);
  }

  TodoListViewModel._(this._todoListStateController, this._filterKindStateController) {
    _todoListStateProvider = StateNotifierProvider((_) {
      _todoListStateController.getTodoList();
      return _todoListStateController;
    });
    _filterKindStateProvider = StateNotifierProvider((_) => _filterKindStateController);
    _filteredTodoListProvider = Provider((ref) {
      final todoList = ref.watch(_todoListStateProvider);
      final currentFilterKind = ref.watch(_filterKindStateProvider);

      switch (currentFilterKind) {
        case FilterKind.completed:
          return todoList.when(
            fixed: (content) => State.fixed(content.filterByCompleted()),
            loading: () => const State.loading(),
            error: (exception) => State.error(exception),
          );
        case FilterKind.incomplete:
          return todoList.when(
            fixed: (content) => State.fixed(content.filterByIncomplete()),
            loading: () => const State.loading(),
            error: (exception) => State.error(exception),
          );
        case FilterKind.all:
        default:
          return todoList;
      }
    });
  }

  Provider get filteredTodoListStateProvider => _filteredTodoListProvider;

  StateNotifierProvider get filterKindStateProvider => _filterKindStateProvider;

  dispose() {
    _todoListStateController.dispose();
    _filterKindStateController.dispose();
  }

  completeTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    _todoListStateController.updateTodo(newTodo);
  }

  undoTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    _todoListStateController.updateTodo(newTodo);
  }

  bool isSelectedFilterKind(final FilterKind filterKind) => _filterKindStateController.isCurrentFilterKind(filterKind);

  onSelectFilterKind(final FilterKind filterKind) => _filterKindStateController.changeFilterKind(filterKind);
}
