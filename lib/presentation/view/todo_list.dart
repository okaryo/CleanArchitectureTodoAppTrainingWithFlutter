import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/todo.dart';

import '../viewmodel/todolist/todo_list.dart';
import 'todo_form.dart';
import 'widgets/chips_bar.dart';
import 'widgets/todo_card.dart';

class TodoListPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTodos = useState<List<Todo>?>(null);
    final todos = ref.watch(todoListViewModelProvider);
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 800;
          if (isTablet) {
            return _buildListAndDetails(context, todos, selectedTodos);
          } else {
            return _buildListWidget(context, todos, selectedTodos, (todo) {
              if (todo != null) {
                Navigator.push<Todo?>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TodoFormPage(todo: todo),
                  ),
                ).then((result) async {
                  selectedTodos.value = result == null ? null : [result];
                });
              }
            });
          }
        },
      ),
    );
  }

  Widget _buildListWidget(
    final BuildContext context,
    final AsyncValue<List<Todo>> todos,
    final ValueNotifier<List<Todo>?> selectedTodos,
    final ValueChanged<Todo?> onSelect,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
      ),
      body: Column(
        children: [
          ChipsBarWidget(),
          const Divider(height: 2, color: Colors.grey),
          Expanded(
            child: todos.when(
              data: (todos) => _buildTodoListWidget(
                context,
                todos,
                selectedTodos,
                onSelect,
              ),
              error: (error, __) => _buildErrorWidget(error.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context, selectedTodos),
    );
  }

  Widget _buildTodoListWidget(
    final BuildContext context,
    final List<Todo> todoList,
    final ValueNotifier<List<Todo>?> selectedTodos,
    final ValueChanged<Todo?> onSelect,
  ) {
    if (todoList.isEmpty) {
      return const Center(child: Text('No TODO'));
    } else {
      return _buildListViewWidget(context, todoList, onSelect);
    }
  }

  Widget _buildListViewWidget(
    final BuildContext context,
    final List<Todo> todoList,
    final ValueChanged<Todo?> onSelect,
  ) =>
      ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return TodoCard(
            todo: todoList[index],
            onTap: () => onSelect(todoList[index]),
          );
        },
      );

  Widget _buildListAndDetails(
    final BuildContext context,
    final AsyncValue<List<Todo>> todos,
    final ValueNotifier<List<Todo>?> selectedTodos,
  ) {
    return Consumer(
      builder: (context, watch, _) {
        return todos.when(
          data: (todoList) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  maxWidth: 400,
                ),
                child: _buildListWidget(context, todos, selectedTodos, (todo) {
                  selectedTodos.value = todo != null ? [todo] : null;
                }),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child:
                    selectedTodos.value == null || selectedTodos.value!.isEmpty
                        ? const Center(child: Text('No TODO selected'))
                        : TodoFormPage(
                            key: ValueKey(selectedTodos.value!.first),
                            todo: selectedTodos.value!.first,
                            showSave: false,
                          ),
              ),
            ],
          ),
          error: (error, __) => _buildErrorWidget(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildFloatingActionButton(
    final BuildContext context,
    final ValueNotifier<List<Todo>?> selectedTodos,
  ) {
    return FloatingActionButton(
      onPressed: () => Navigator.push<Todo?>(
        context,
        MaterialPageRoute(
          builder: (_) => const TodoFormPage(),
        ),
      ).then((result) async {
        selectedTodos.value = result == null ? null : [result];
      }),
      tooltip: 'Add TODO',
      child: const Icon(Icons.add),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(child: Text('An error has occurred! $message'));
  }
}
