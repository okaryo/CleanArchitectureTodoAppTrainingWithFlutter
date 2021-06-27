import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase_impl.dart';
import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

class DomainModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<GetTodoListUseCase>(() => GetTodoListUseCaseImpl(get())),
      single<CreateTodoUseCase>(() => CreateTodoUseCaseImpl(get())),
      single<UpdateTodoUseCase>(() => UpdateTodoUseCaseImpl(get())),
      single<DeleteTodoUseCase>(() => DeleteTodoUseCaseImpl(get())),
    ];
  }
}
