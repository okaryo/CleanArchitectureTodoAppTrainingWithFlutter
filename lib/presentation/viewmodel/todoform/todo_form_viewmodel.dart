import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';

class TodoFormViewModel {
  final CreateTodoUseCase _createTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  late TodoId _id;
  var _title = '';
  var _description = '';
  var _isCompleted = false;
  var _dueDate = DateTime.now();
  var _isNewTodo = false;

  TodoFormViewModel(
    this._createTodoUseCase,
    this._updateTodoUseCase,
    this._deleteTodoUseCase,
  );

  initTodo(final Todo? todo) {
    if (todo == null) {
      _isNewTodo = true;
    } else {
      _id = todo.id;
      _title = todo.title;
      _description = todo.description;
      _isCompleted = todo.isCompleted;
      _dueDate = todo.dueDate;
    }
  }

  createOrUpdateTodo() async {
    if (_isNewTodo) {
      await _createTodoUseCase.execute(_title, _description, _isCompleted, _dueDate);
    } else {
      await _updateTodoUseCase.execute(_id, _title, _description, _isCompleted, _dueDate);
    }
  }

  deleteTodo() async {
    if (!_isNewTodo) await _deleteTodoUseCase.execute(_id);
  }

  setTitle(final String value) => _title = value;

  setDescription(final String value) => _description = value;

  setTodoStatus(final bool status) => _isCompleted = status;

  setDueDate(final DateTime value) => _dueDate = value;

  String? validateTitle() {
    if (_title.isEmpty) {
      return 'Enter a title.';
    } else if (_title.length > 20) {
      return 'Limit the title to 20 characters.';
    } else {
      return null;
    }
  }

  String? validateDescription() {
    if (_description.length > 100) {
      return 'Limit the description to 100 characters.';
    } else {
      return null;
    }
  }

  String? validateDueDate() {
    if (_isNewTodo && _dueDate.isBefore(DateTime.now())) {
      return "DueDate must be after today's date.";
    } else {
      return null;
    }
  }
}
