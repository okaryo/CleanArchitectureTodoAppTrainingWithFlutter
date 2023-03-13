import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/todo.dart';
import '../../utils/constants.dart';
import '../todolist/todo_list.dart';
import 'package:intl/intl.dart';

part 'todo_form.g.dart';

@riverpod
class TodoFormViewModel extends _$TodoFormViewModel {
  late final TodoListViewModel todoListViewModel = ref.watch(todoListViewModelProvider.notifier);

  int? _id;
  String _title = '';
  String? _description;
  bool _isCompleted = false;
  DateTime _dueDate = DateTime.now();

  bool get isNew => _id == null;

  @override
  Future<void> build(Todo? todo) async {
    if (todo == null) {
      _id = null;
    } else {
      _id = todo.id;
      _title = todo.title;
      _description = todo.description;
      _isCompleted = todo.isCompleted;
      _dueDate = todo.dueDate;
    }
  }

  void createOrUpdateTodo() {
    if (_id != null) {
      todoListViewModel.updateTodo(Todo(
        id: _id!,
        title: _title,
        description: _description,
        isCompleted: _isCompleted,
        dueDate: _dueDate,
      ));
    } else {
      todoListViewModel.addTodo(
        _title,
        _description,
        _isCompleted,
        _dueDate,
      );
    }
  }

  void deleteTodo() {
    if (isNew) return;
    todoListViewModel.deleteTodo(_id!);
  }

  String appBarTitle() => isNew ? 'Add TODO' : 'Edit TODO';

  String initialTitleValue() => _title;

  String? initialDescriptionValue() => _description;

  DateTime initialDueDateValue() => _dueDate;

  String initialDueDateString() => dateFormat.format(initialDueDateValue());

  DateTime datePickerFirstDate() => DateTime(DateTime.now().year - 5, 1, 1);

  DateTime datePickerLastDate() => DateTime(DateTime.now().year + 5, 12, 31);

  bool shouldShowDeleteTodoIcon() => !isNew;

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
    if (_description != null && _description!.length > 100) {
      return 'Limit the description to 100 characters.';
    } else {
      return null;
    }
  }

  String? validateDueDate() {
    if (isNew && _dueDate.isBefore(DateTime.now())) {
      return "DueDate must be after today's date.";
    } else {
      return null;
    }
  }
}
