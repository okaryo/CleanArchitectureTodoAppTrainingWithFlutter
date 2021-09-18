import 'package:clean_architecture_todo_app/data/data_module.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/create_todo_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/delete_todo_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/get_todo_list_usecase_impl.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase.dart';
import 'package:clean_architecture_todo_app/domain/usecase/update_todo_usecase_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTodoListUseCaseProvider =
    Provider<GetTodoListUseCase>((ref) => GetTodoListUseCaseImpl(ref.watch(todosRepositoryProvider)));
final createTodoUseCaseProvider =
    Provider<CreateTodoUseCase>((ref) => CreateTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
final updateTodoUseCaseProvider =
    Provider<UpdateTodoUseCase>((ref) => UpdateTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
final deleteTodoUseCaseProvider =
    Provider<DeleteTodoUseCase>((ref) => DeleteTodoUseCaseImpl(ref.watch(todosRepositoryProvider)));
