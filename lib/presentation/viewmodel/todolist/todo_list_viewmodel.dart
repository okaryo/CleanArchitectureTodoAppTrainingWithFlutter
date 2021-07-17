import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/presentation/state/todo_list_state_controller.dart';

class TodoListViewModel {
  final TodoListStateController _todoListStateController;

  TodoListViewModel(this._todoListStateController) {
    _getTodoList();
  }

  TodoListStateController get todoListStateController => _todoListStateController;

  dispose() {
    _todoListStateController.dispose();
  }

  completeTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: true);
    _todoListStateController.updateTodo(newTodo);
  }

  undoTodo(final Todo todo) {
    final newTodo = todo.copyWith(isCompleted: false);
    _todoListStateController.updateTodo(newTodo);
  }

  _getTodoList() {
    _todoListStateController.getTodoList();
  }
}
