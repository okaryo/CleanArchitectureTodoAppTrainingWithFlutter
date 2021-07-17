import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/presentation/state/todo_list_state_controller.dart';

class TodoFormViewModel {
  final TodoListStateController _todoListStateController;
  late TodoId _id;
  var _title = '';
  var _description = '';
  var _isCompleted = false;
  var _dueDate = DateTime.now();
  var _isNewTodo = false;

  TodoFormViewModel(this._todoListStateController);

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

  createOrUpdateTodo() {
    if (_isNewTodo) {
      _todoListStateController.addTodo(_title, _description, _isCompleted, _dueDate);
    } else {
      final newTodo = Todo(
        id: _id,
        title: _title,
        description: _description,
        isCompleted: _isCompleted,
        dueDate: _dueDate,
      );
      _todoListStateController.updateTodo(newTodo);
    }
  }

  deleteTodo() {
    if (!_isNewTodo) _todoListStateController.deleteTodo(_id);
  }

  String appBarTitle() => _isNewTodo ? 'Add ToDo' : 'Edit ToDo';

  String initialTitleValue() => _title;

  String initialDescriptionValue() => _description;

  DateTime initialDueDateValue() => _dueDate;

  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);

  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);

  bool shouldShowDeleteTodoIcon() => !_isNewTodo;

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
