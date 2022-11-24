import '../../../domain/model/todo.dart';
import '../../../domain/model/todo_id.dart';
import '../todolist/todo_list_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final todoFormViewModelProvider =
    Provider.autoDispose.family<TodoFormViewModel, Todo?>((ref, todo) {
  return TodoFormViewModel(ref.read, todo);
});

class TodoFormViewModel {
  late final TodoListViewModel _todoListViewModel;
  late TodoId _id;
  var _title = '';
  var _description = '';
  var _isCompleted = false;
  var _dueDate = DateTime.now();
  var _isNewTodo = false;

  TodoFormViewModel(final Reader read, final Todo? todo) {
    _todoListViewModel = read(todoListViewModelStateNotifierProvider.notifier);
    _initTodo(todo);
  }

  void _initTodo(final Todo? todo) {
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

  void createOrUpdateTodo() {
    if (_isNewTodo) {
      _todoListViewModel.addTodo(_title, _description, _isCompleted, _dueDate);
    } else {
      final newTodo = Todo(
        id: _id,
        title: _title,
        description: _description,
        isCompleted: _isCompleted,
        dueDate: _dueDate,
      );
      _todoListViewModel.updateTodo(newTodo);
    }
  }

  void deleteTodo() {
    if (!_isNewTodo) _todoListViewModel.deleteTodo(_id);
  }

  String appBarTitle() => _isNewTodo ? 'Add TODO' : 'Edit TODO';

  String initialTitleValue() => _title;

  String initialDescriptionValue() => _description;

  DateTime initialDueDateValue() => _dueDate;

  String initialDueDateString() =>
      DateFormat('yyyy/MM/dd').format(initialDueDateValue());

  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);

  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);

  bool shouldShowDeleteTodoIcon() => !_isNewTodo;

  void setTitle(final String value) => _title = value;

  void setDescription(final String value) => _description = value;

  void setTodoStatus(final bool status) => _isCompleted = status;

  void setDueDate(final DateTime value) => _dueDate = value;

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
