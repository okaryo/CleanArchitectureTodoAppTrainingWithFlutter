import 'package:clean_architecture_todo_app/presentation/state/filter_kind_state_controller.dart';
import 'package:clean_architecture_todo_app/presentation/state/todo_list_state_controller.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todoform/todo_form_viewmodel.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';
import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

class PresentationModule extends Module {
  @override
  List<Bean> register() {
    return [
      factory<TodoListViewModel>(() => TodoListViewModel(get(), get())),
      factory<TodoFormViewModel>(() => TodoFormViewModel(get())),
      factory<TodoListStateController>(() => TodoListStateController(get(), get(), get(), get())),
      factory<FilterKindStateController>(() => FilterKindStateController()),
    ];
  }
}
