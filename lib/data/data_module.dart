import 'package:clean_architecture_todo_app/data/database/todos_database.dart';
import 'package:clean_architecture_todo_app/data/database/todos_database_impl.dart';
import 'package:clean_architecture_todo_app/data/repository/todos_repository_impl.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

class DataModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<TodosDatabase>(() => TodosDatabaseImpl()),
      single<TodosRepository>(() => TodosRepositoryImpl(get())),
    ];
  }
}
