import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_state.dart';
import 'package:rxdart/rxdart.dart';

class TodoListViewModel {
  final _stateSubject = BehaviorSubject<TodoListState>();
  final GetTodoListUseCase _getTodoListUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  late TodoList _todoList;

  TodoListViewModel(this._getTodoListUseCase, this._updateTodoUseCase) {
    _getTodoList();
  }

  BehaviorSubject<TodoListState> get stateSubject => _stateSubject;

  dispose() {
    _stateSubject.close();
  }

  completeTodo(final Todo todo) async {
    final newTodo = todo.copyWith(isCompleted: true);
    await _updateTodo(newTodo);
  }

  undoTodo(final Todo todo) async {
    final newTodo = todo.copyWith(isCompleted: false);
    await _updateTodo(newTodo);
  }

  _updateTodo(final Todo newTodo) async {
    await _updateTodoUseCase.execute(
      newTodo.id,
      newTodo.title,
      newTodo.description,
      newTodo.isCompleted,
      newTodo.dueDate,
    );
    _todoList = TodoList(
      values: _todoList.values.map((todo) => todo.id == newTodo.id ? newTodo : todo).toList(),
    );
    _stateSubject.add(TodoListState.completed(_todoList));
  }

  _getTodoList() async {
    try {
      _todoList = await _getTodoListUseCase.execute();
      _stateSubject.add(TodoListState.completed(_todoList));
    } on Exception catch (exception) {
      _stateSubject.add(TodoListState.error(exception));
    }
  }
}
