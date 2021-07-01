import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_view_model.dart';
import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

class PresentationModule extends Module {
  @override
  List<Bean> register() {
    return [
      factory<TodoListViewModel>(() => TodoListViewModel(get(), get())),
    ];
  }
}
