import '../../domain/model/todo.dart';
import '../../domain/model/todo_list.dart';
import 'todo_form_page.dart';
import '../viewmodel/todolist/filter_kind_viewmodel.dart';
import '../viewmodel/todolist/todo_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TodoListPage extends StatelessWidget {
  final _filteredTodoListProvider = filteredTodoListProvider;
  final _todoListProvider = todoListViewModelStateNotifierProvider;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: Column(
        children: [
          ChipsBarWidget(),
          const Divider(height: 2, color: Colors.grey),
          Consumer(
            builder: (context, watch, _) {
              return watch(_filteredTodoListProvider).maybeWhen(
                success: (content) =>
                    _buildTodoListContainerWidget(context, content),
                error: (_) => _buildErrorWidget(),
                orElse: () => const Expanded(
                    child: Center(child: CircularProgressIndicator())),
              );
            },
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildTodoListContainerWidget(
      final BuildContext context, final TodoList todoList) {
    return Expanded(child: _buildTodoListWidget(context, todoList));
  }

  Widget _buildTodoListWidget(
      final BuildContext context, final TodoList todoList) {
    if (todoList.length == 0) {
      return const Center(child: Text('No ToDo'));
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return _buildTodoItemCardWidget(context, todoList[index]);
        },
      );
    }
  }

  Widget _buildTodoItemCardWidget(final BuildContext context, final Todo todo) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(todo.dueDate),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      todo.description.isEmpty
                          ? 'No Description'
                          : todo.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              todo.isCompleted
                  ? _buildCheckedIcon(context, todo)
                  : _buildUncheckedIcon(context, todo),
            ],
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TodoFormPage(todo),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckedIcon(final BuildContext context, final Todo todo) {
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

  Widget _buildFloatingActionButton(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const TodoFormPage(null),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }
}

class ChipsBarWidget extends StatelessWidget {
  final _provider = filterKindViewModelStateNotifierProvider;

  @override
  Widget build(final BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final viewModel = watch(_provider.notifier);
        watch(_provider);
        return SizedBox(
          height: kToolbarHeight,
          child: ListView(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 3,
              bottom: 3,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              buildChip(
                context,
                viewModel.isFilteredByAll(),
                'All',
                viewModel.filterByAll,
              ),
              const SizedBox(width: 8),
              buildChip(
                context,
                viewModel.isFilteredByCompleted(),
                'Completed',
                viewModel.filterByCompleted,
              ),
              const SizedBox(width: 8),
              buildChip(
                context,
                viewModel.isFilteredByIncomplete(),
                'Incomplete',
                viewModel.filterByIncomplete,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildChip(
    BuildContext context,
    bool checked,
    String label,
    VoidCallback onSelect,
  ) {
    return InputChip(
      showCheckmark: checked,
      label: Text(label),
      selected: checked,
      onSelected: (_) => onSelect(),
      selectedColor: checked ? Theme.of(context).colorScheme.tertiary : null,
      labelStyle: checked
          ? TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
            )
          : null,
      checkmarkColor: checked ? Theme.of(context).colorScheme.onTertiary : null,
    );
  }
}
