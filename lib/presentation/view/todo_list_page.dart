import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_form_page.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/filter_kind_viewmodel.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';
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
            builder: (context, ref, _) {
              return ref.watch(_filteredTodoListProvider).maybeWhen(
                    success: (content) => _buildTodoListContainerWidget(ref, content),
                    error: (_) => _buildErrorWidget(),
                    orElse: () => const Expanded(child: Center(child: CircularProgressIndicator())),
                  );
            },
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildTodoListContainerWidget(WidgetRef ref, final TodoList todoList) {
    return Expanded(child: _buildTodoListWidget(ref, todoList));
  }

  Widget _buildTodoListWidget(final WidgetRef ref, final TodoList todoList) {
    if (todoList.length == 0) {
      return const Center(child: Text('No ToDo'));
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (final BuildContext context, final int index) {
          return _buildTodoItemCardWidget(context, ref, todoList[index]);
        },
      );
    }
  }

  Widget _buildTodoItemCardWidget(final BuildContext context, final WidgetRef ref, final Todo todo) {
    return InkWell(
      child: Card(
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
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('yyyy/MM/dd').format(todo.dueDate),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      todo.description.isEmpty ? 'No Description' : todo.description,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              todo.isCompleted ? _buildCheckedIcon(ref, todo) : _buildUncheckedIcon(ref, todo),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TodoFormPage(todo),
          )),
    );
  }

  Widget _buildCheckedIcon(final WidgetRef ref, final Todo todo) {
    return InkResponse(
      onTap: () => ref.watch(_todoListProvider.notifier).undoTodo(todo),
      splashColor: Colors.transparent,
      child: const Icon(Icons.done, size: 24, color: Colors.lightGreen),
    );
  }

  Widget _buildUncheckedIcon(final WidgetRef ref, final Todo todo) {
    return InkResponse(
      onTap: () => ref.watch(_todoListProvider.notifier).completeTodo(todo),
      splashColor: Colors.transparent,
      child: const Icon(
        Icons.radio_button_off_rounded,
        size: 24,
        color: Colors.grey,
      ),
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
      builder: (context, ref, _) {
        final viewModel = ref.watch(_provider.notifier);
        ref.watch(_provider);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                InputChip(
                  label: const Text('All'),
                  selected: viewModel.isFilteredByAll(),
                  onSelected: (_) => viewModel.filterByAll(),
                  selectedColor: viewModel.isFilteredByAll() ? Colors.lightGreen : null,
                ),
                const SizedBox(width: 8),
                InputChip(
                  label: const Text('Completed'),
                  selected: viewModel.isFilteredByCompleted(),
                  onSelected: (_) => viewModel.filterByCompleted(),
                  selectedColor: viewModel.isFilteredByCompleted() ? Colors.lightGreen : null,
                ),
                const SizedBox(width: 8),
                InputChip(
                  label: const Text('Incomplete'),
                  selected: viewModel.isFilteredByIncomplete(),
                  onSelected: (_) => viewModel.filterByIncomplete(),
                  selectedColor: viewModel.isFilteredByIncomplete() ? Colors.lightGreen : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
