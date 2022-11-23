import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/todo.dart';
import '../../viewmodel/todolist/todo_list_viewmodel.dart';

class TodoCard extends HookWidget {
  TodoCard({
    Key? key,
    required this.todo,
    required this.onTap,
  }) : super(key: key);

  final Todo todo;
  final VoidCallback onTap;

  final _todoListProvider = todoListViewModelStateNotifierProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.surfaceVariant,
      child: ListTile(
        onTap: onTap,
        isThreeLine: todo.description.isNotEmpty,
        title: Text(todo.title),
        subtitle: Text(DateFormat('yyyy/MM/dd').format(todo.dueDate) +
            '\n${todo.description.isEmpty ? 'No Description' : todo.description}'),
        trailing: Switch(
          value: todo.isCompleted,
          onChanged: (value) {
            final controller = context.read(_todoListProvider.notifier);
            if (value) {
              controller.completeTodo(todo);
            } else {
              controller.undoTodo(todo);
            }
          },
        ),
      ),
    );
  }
}
