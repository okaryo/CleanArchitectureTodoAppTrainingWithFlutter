import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/todo.dart';
import '../utils/constants.dart';
import '../viewmodel/todolist/todo_list.dart';

class TodoCard extends ConsumerWidget {
  const TodoCard({
    Key? key,
    required this.todo,
    required this.onTap,
  }) : super(key: key);

  final Todo todo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.surfaceVariant,
      child: ListTile(
        onTap: onTap,
        isThreeLine: todo.description.isNotEmpty,
        title: Text(todo.title),
        subtitle: Builder(builder: (context) {
          final sb = StringBuffer();
          sb.write(dateFormat.format(todo.dueDate));
          sb.writeln();
          if (todo.description.isEmpty) {
            sb.write('No Description');
          } else {
            sb.write(todo.description);
          }
          return Text(sb.toString());
        }),
        trailing: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            final controller = ref.read(todoListViewModelProvider.notifier);
            if (value == true) {
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

extension on String? {
  bool get isEmpty => this == null || this!.isEmpty;
  bool get isNotEmpty => !isEmpty;
}
