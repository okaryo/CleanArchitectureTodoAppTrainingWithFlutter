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
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultTextStyle(
            style: TextStyle(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: theme.textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        DateFormat('yyyy/MM/dd').format(todo.dueDate),
                        style: theme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        todo.description.isEmpty
                            ? 'No Description'
                            : todo.description,
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                _buildIcon(context, todo),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildIcon(
    final BuildContext context,
    final Todo todo,
  ) {
    return todo.isCompleted
        ? _buildCheckedIcon(context, todo)
        : _buildUncheckedIcon(context, todo);
  }

  Widget _buildCheckedIcon(
    final BuildContext context,
    final Todo todo,
  ) {
    return InkResponse(
      child: const Icon(Icons.done, size: 24, color: Colors.lightGreen),
      onTap: () => context.read(_todoListProvider.notifier).undoTodo(todo),
      splashColor: Colors.transparent,
    );
  }

  Widget _buildUncheckedIcon(final BuildContext context, final Todo todo) {
    return InkResponse(
      child: Icon(
        Icons.radio_button_off_rounded,
        size: 24,
        color: Theme.of(context).colorScheme.outline,
      ),
      onTap: () => context.read(_todoListProvider.notifier).completeTodo(todo),
      splashColor: Colors.transparent,
    );
  }
}
