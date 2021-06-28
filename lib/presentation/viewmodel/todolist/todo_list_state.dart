import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState.completed(final TodoList todoList) =
      _TodoListStateCompleted;

  const factory TodoListState.loading() = _TodoListStateLoading;

  const factory TodoListState.error(final Exception exception) =
      _TodoListStateError;
}
