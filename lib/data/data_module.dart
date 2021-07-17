import 'package:clean_architecture_todo_app/data/repository/todos_repository_impl.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:dain/bean/bean.dart';
import 'package:dain/module/module.dart';

import 'datasource/database/todos_database.dart';
import 'datasource/database/todos_database_impl.dart';

class DataModule extends Module {
  @override
  List<Bean> register() {
    return [
      single<TodosDatabase>(() => TodosDatabaseImpl()),
      single<TodosRepository>(() => TodosRepositoryImpl(get())),
    ];
  }
}
