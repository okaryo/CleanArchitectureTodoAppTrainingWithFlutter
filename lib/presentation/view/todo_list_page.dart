import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/todo.dart';
import '../../domain/model/todo_list.dart';
import '../viewmodel/todolist/todo_list_viewmodel.dart';
import 'todo_form_page.dart';
import 'widgets/chips_bar.dart';
import 'widgets/todo_card.dart';

class TodoListPage extends HookWidget {
  final _filteredTodoListProvider = filteredTodoListProvider;

  @override
  Widget build(final BuildContext context) {
    final selectedTodos = useState<List<Todo>?>(null);
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth > 800;
          if (isTablet) {
            return _buildListAndDetails(context, selectedTodos);
          } else {
            return _buildListWidget(context, selectedTodos, (todo) {
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
            child: Consumer(
              builder: (context, watch, _) {
                return watch(_filteredTodoListProvider).maybeWhen(
                    success: (content) => _buildTodoListContainerWidget(
                          context,
                          content,
                          selectedTodos,
                          onSelect,
                        ),
                    error: (_) => _buildErrorWidget(),
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context, selectedTodos),
    );
  }

  Widget _buildTodoListContainerWidget(
    final BuildContext context,
    final TodoList todoList,
    final ValueNotifier<List<Todo>?> selectedTodos,
    final ValueChanged<Todo?> onSelect,
  ) {
    return _buildTodoListWidget(
      context,
      todoList,
      selectedTodos,
      onSelect,
    );
  }

  Widget _buildTodoListWidget(
    final BuildContext context,
    final TodoList todoList,
    final ValueNotifier<List<Todo>?> selectedTodos,
    final ValueChanged<Todo?> onSelect,
  ) {
    if (todoList.length == 0) {
      return const Center(child: Text('No TODO'));
    } else {
      return _buildListViewWidget(context, todoList, onSelect);
    }
  }

  Widget _buildListViewWidget(
    final BuildContext context,
    final TodoList todoList,
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
    final ValueNotifier<List<Todo>?> selectedTodos,
  ) {
    return Consumer(
      builder: (context, watch, _) {
        return watch(_filteredTodoListProvider).maybeWhen(
          success: (todoList) => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  maxWidth: 400,
                ),
                child: _buildListWidget(context, selectedTodos, (todo) {
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
          error: (_) => _buildErrorWidget(),
          orElse: () => const Center(child: CircularProgressIndicator()),
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
      child: const Icon(Icons.add),
      tooltip: 'Add TODO',
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }
}
