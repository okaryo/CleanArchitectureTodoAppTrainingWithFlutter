import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../viewmodel/todolist/search_todo_list.dart';
import 'todo_form.dart';
import '../widgets/todo_card.dart';

class SearchTodoList extends HookConsumerWidget {
  const SearchTodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = useState('');
    final todos = ref.watch(searchTodoListViewModelProvider(search.value));
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search TODO',
            border: InputBorder.none,
          ),
          onChanged: (value) => search.value = value,
        ),
      ),
      body: todos.when(
        data: (todos) {
          if (todos.isEmpty) {
            return const Center(child: Text('No TODO found'));
          }
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoCard(
                todo: todo,
                onTap: () => context.push('/todo/${todo.id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
