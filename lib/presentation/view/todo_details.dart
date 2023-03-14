import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/todolist/todo_list.dart';
import 'todo_form.dart';

class TodoDetails extends ConsumerWidget {
  const TodoDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final todos = ref.watch(todoListViewModelProvider);
    const Widget title = Text('TODO Details');
    return todos.map(
      loading: (_) => Scaffold(
        appBar: AppBar(title: title),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error) => Scaffold(
        appBar: AppBar(title: title),
        body: Center(child: Text('Error loading TODO: $error')),
      ),
      data: (todos) {
        final todo = todos.value.firstWhereOrNull((todo) => todo.id.toString() == id);
        if (todo != null) {
          return TodoFormPage(
            key: ValueKey(todo),
            todo: todo,
            showSave: false,
          );
        } else {
          return Scaffold(
            appBar: AppBar(title: title),
            body: Center(
              child: Text(
                'TODO not found',
                style: theme.textTheme.titleLarge,
              ),
            ),
          );
        }
      },
    );
  }
}
