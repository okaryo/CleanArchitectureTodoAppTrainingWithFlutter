import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/todo.dart';

import '../viewmodel/todolist/todo_list.dart';
import '../widgets/master_detail.dart';
import 'search_todo_list.dart';
import 'todo_form.dart';
import 'widgets/chips_bar.dart';
import 'widgets/todo_card.dart';

class TodoListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final todos = ref.watch(todoListViewModelProvider);
    return MasterDetailWidget<Todo>(
      listWidth: 400,
      items: todos.valueOrNull ?? [],
      listBuilder: (context, todos, current, onSelect) => Scaffold(
        appBar: AppBar(
          title: const Text('TODO App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search TODO',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SearchTodoList(),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            ChipsBarWidget(),
            Divider(height: 2, color: theme.colorScheme.outlineVariant),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: todos.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => TodoCard(
                  todo: todos[index],
                  onTap: () => onSelect(todos[index]),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push<Todo?>(
            context,
            MaterialPageRoute(
              builder: (_) => const TodoFormPage(),
            ),
          ).then(onSelect),
          tooltip: 'Add TODO',
          child: const Icon(Icons.add),
        ),
      ),
      detailBuilder: (context, todo) => TodoFormPage(
        key: ValueKey(todo),
        todo: todo,
        showSave: false,
      ),
      emptyBuilder: (_) => const Material(child: Center(child: Text('Select a TODO'))),
    );
  }
}
