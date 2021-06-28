import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_state.dart';
import 'package:rxdart/rxdart.dart';

class TodoListViewModel {
  final _stateSubject = BehaviorSubject<TodoListState>();
  final GetTodoListUseCase _getTodoListUseCase;
  late TodoList _todoList;

  TodoListViewModel(this._getTodoListUseCase) {
    _getTodoList();
  }

  BehaviorSubject<TodoListState> get stateSubject => _stateSubject;

  dispose() {
    _stateSubject.close();
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
