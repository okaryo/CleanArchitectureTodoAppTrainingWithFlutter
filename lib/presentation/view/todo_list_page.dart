import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_form_page.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_state.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_viewmodel.dart';
import 'package:dain/dain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _viewModel = Dain.inject<TodoListViewModel>();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: StreamBuilder(
        stream: _viewModel.stateSubject,
        initialData: const TodoListState.loading(),
        builder: (
          final BuildContext context,
          final AsyncSnapshot<TodoListState> snapshot,
        ) {
          return snapshot.data!.when(
            completed: (todoList) => _buildTodoListWidget(todoList),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (_) => _buildErrorWidget(),
          );
        },
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildTodoListWidget(TodoList todoList) {
    if (todoList.length == 0) {
      return const Center(child: Text('No ToDo'));
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.length,
        itemBuilder: (final BuildContext context, final int index) {
          return _buildTodoItemCardWidget(todoList[index]);
        },
      );
    }
  }

  Widget _buildTodoItemCardWidget(final Todo todo) {
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
    return InkWell(
      child: const Icon(Icons.done, size: 24, color: Colors.lightGreen),
      onTap: () => _viewModel.undoTodo(todo),
    );
  }

  Widget _buildUncheckedIcon(final Todo todo) {
    return InkWell(
      child: const Icon(Icons.radio_button_off_rounded, size: 24, color: Colors.grey),
      onTap: () => _viewModel.undoTodo(todo),
    );
  }

  Widget _buildFloatingActionButton() {
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
