import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/model/todo.dart';
import '../todolist/todo_list.dart';

part 'todo_form.g.dart';

typedef FormData = Map<String, dynamic>;

@riverpod
class TodoFormViewModel extends _$TodoFormViewModel {
  late final TodoListViewModel todoListViewModel =
      ref.watch(todoListViewModelProvider.notifier);
  FormData _formData = {};
  bool _edited = false;

  bool get isNew => _formData.id == null;
  bool get isEdited => _edited;

  @override
  FormData build(Todo? todo) {
    return _formData = {
      'id': todo?.id,
      'title': todo?.title,
      'description': todo?.description,
      'isCompleted': todo?.isCompleted ?? false,
      'dueDate': todo?.dueDate ?? DateTime.now(),
    };
  }

  Future<void> createOrUpdateTodo() {
    final id = _formData.id;
    final title = _formData.title;
    final description = _formData.description;
    final isCompleted = _formData.isCompleted;
    final dueDate = _formData.dueDate;

    if (title == null) {
      throw Exception('Title is null');
    }

    if (!isNew) {
      return todoListViewModel.updateTodo(Todo(
        id: id!,
        title: title,
        description: description,
        isCompleted: isCompleted,
        dueDate: dueDate,
      ));
    } else {
      return todoListViewModel.addTodo(
        title,
        description,
        isCompleted,
        dueDate,
      );
    }
  }

  Future<void> deleteTodo() async {
    if (isNew) return;
    final id = _formData.id;
    return todoListViewModel.deleteTodo(id!);
  }

  bool canDelete() => !isNew;

  void setTitle(String value) {
    _formData['title'] = value;
    _edited = true;
    state = _formData;
  }

  void setDescription(String value) {
    _formData['description'] = value;
    _edited = true;
    state = _formData;
  }

  void setTodoStatus(bool status) {
    _formData['isCompleted'] = status;
    _edited = true;
    state = _formData;
  }

  void setDueDate(DateTime value) {
    _formData['dueDate'] = value;
    _edited = true;
    state = _formData;
  }
}

extension DateUtils on DateTime {
  DateTime get pickerStartDate => DateTime(year - 5, 1, 1);
  DateTime get pickerEndDate => DateTime(year + 5, 12, 31);
}

extension FormDataUtils on FormData {
  int? get id => this['id'];
  String? get title => this['title'];
  String? get description => this['description'];
  bool get isCompleted => this['isCompleted'];
  DateTime get dueDate => this['dueDate'];
}
