import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/presentation/state/state.dart';
import 'package:state_notifier/state_notifier.dart';

class TodoListStateController extends StateNotifier<State<TodoList>> {
  static TodoListStateController? _instance;
  final GetTodoListUseCase _getTodoListUseCase;
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;

  factory TodoListStateController(
    final GetTodoListUseCase getTodoListUseCase,
    final CreateTodoUseCase createTodoUseCase,
    final UpdateTodoUseCase updateTodoUseCase,
    final DeleteTodoUseCase deleteTodoUseCase,
  ) {
    return _instance ??= TodoListStateController._(
      getTodoListUseCase,
      createTodoUseCase,
      updateTodoUseCase,
      deleteTodoUseCase,
    );
  }

  TodoListStateController._(
    this._getTodoListUseCase,
    this._createTodoUseCase,
    this._updateTodoUseCase,
    this._deleteTodoUseCase,
  ) : super(const State.loading());

  getTodoList() async {
    try {
      final todoList = await _getTodoListUseCase.execute();
      state = State.fixed(todoList);
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  addTodo(final String title, final String description, final bool isCompleted, final DateTime dueDate) async {
    try {
      final newTodo = await _createTodoUseCase.execute(
        title,
        description,
        isCompleted,
        dueDate,
      );
      state = state.when(
        fixed: (content) => State.fixed(content.addTodo(newTodo)),
        loading: () => State.fixed(TodoList(values: [newTodo])),
        error: (exception) => State.error(exception),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  updateTodo(final Todo newTodo) async {
    try {
      await _updateTodoUseCase.execute(
        newTodo.id,
        newTodo.title,
        newTodo.description,
        newTodo.isCompleted,
        newTodo.dueDate,
      );
      state = state.when(
        fixed: (content) => State.fixed(content.updateTodo(newTodo)),
        loading: () => State.fixed(TodoList(values: [newTodo])),
        error: (exception) => State.error(exception),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }

  deleteTodo(final TodoId id) async {
    try {
      await _deleteTodoUseCase.execute(id);
      state = state.when(
        fixed: (content) => State.fixed(content.removeTodoById(id)),
        loading: () => const State.loading(),
        error: (exception) => State.error(exception),
      );
    } on Exception catch (e) {
      state = State.error(e);
    }
  }
}
