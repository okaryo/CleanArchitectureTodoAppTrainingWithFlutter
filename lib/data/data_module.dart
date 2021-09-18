import 'package:clean_architecture_todo_app/data/repository/todos_repository_impl.dart';
import 'package:clean_architecture_todo_app/domain/repository/todos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'datasource/database/todos_database.dart';
import 'datasource/database/todos_database_impl.dart';

final todosDatabaseProvider = Provider<TodosDatabase>((_) => TodosDatabaseImpl());
final todosRepositoryProvider =
    Provider<TodosRepository>((ref) => TodosRepositoryImpl(ref.watch(todosDatabaseProvider)));
