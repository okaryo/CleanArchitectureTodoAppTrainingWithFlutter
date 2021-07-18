import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_form_page.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/filter_kind.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';
import 'package:dain/dain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TodoListPage extends HookConsumerWidget {
  final _viewModel = Dain.inject<TodoListViewModel>();

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: HookBuilder(
        builder: (final BuildContext context) {
          final filteredTodoListState = ref.watch(_viewModel.filteredTodoListStateProvider);
          return filteredTodoListState.when(
            fixed: (content) => _buildTodoListContainerWidget(context, content),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_) => _buildErrorWidget(),
          );
        },
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildTodoListContainerWidget(final BuildContext context, final TodoList todoList) {
    return Column(
      children: [
        ChipsBarWidget(),
        const Divider(height: 2, color: Colors.grey),
        Expanded(child: _buildTodoListWidget(context, todoList)),
      ],
    );
  }

  Widget _buildTodoListWidget(final BuildContext context, final TodoList todoList) {
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
              todo.isCompleted ? _buildCheckedIcon(todo) : _buildUncheckedIcon(todo),
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

  Widget _buildCheckedIcon(final Todo todo) {
    return InkResponse(
      child: const Icon(Icons.done, size: 24, color: Colors.lightGreen),
      onTap: () => _viewModel.undoTodo(todo),
      splashColor: Colors.transparent,
    );
  }

  Widget _buildUncheckedIcon(final Todo todo) {
    return InkResponse(
      child: const Icon(Icons.radio_button_off_rounded, size: 24, color: Colors.grey),
      onTap: () => _viewModel.completeTodo(todo),
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

class ChipsBarWidget extends HookConsumerWidget {
  final _viewModel = Dain.inject<TodoListViewModel>();

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    return HookBuilder(
      builder: (final BuildContext context) {
        final currentFilterKind = ref.watch(_viewModel.filterKindStateProvider);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                InputChip(
                  label: const Text('All'),
                  selected: _viewModel.isSelectedFilterKind(FilterKind.all),
                  onSelected: (_) => _viewModel.onSelectFilterKind(FilterKind.all),
                  selectedColor: _chipColor(currentFilterKind, FilterKind.all),
                ),
                const SizedBox(width: 8),
                InputChip(
                  label: const Text('Completed'),
                  selected: _viewModel.isSelectedFilterKind(FilterKind.completed),
                  onSelected: (_) => _viewModel.onSelectFilterKind(FilterKind.completed),
                  selectedColor: _chipColor(currentFilterKind, FilterKind.completed),
                ),
                const SizedBox(width: 8),
                InputChip(
                  label: const Text('Incomplete'),
                  selected: _viewModel.isSelectedFilterKind(FilterKind.incomplete),
                  onSelected: (_) => _viewModel.onSelectFilterKind(FilterKind.incomplete),
                  selectedColor: _chipColor(currentFilterKind, FilterKind.incomplete),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color? _chipColor(final FilterKind currentFilterKind, final FilterKind filterKind) {
    return currentFilterKind == filterKind ? Colors.lightGreen : null;
  }
}
