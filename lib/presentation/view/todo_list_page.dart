import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_list.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_state.dart';
import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/todo_list_view_model.dart';
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
  Widget build(BuildContext context) {
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
    // FIXME: 仮置き
    todoList = TodoList(values: [
      Todo(
          id: const TodoId(value: 1),
          title: 'title' * 50,
          description: 'description',
          isCompleted: true,
          dueDate: DateTime.now()),
      Todo(
          id: const TodoId(value: 1),
          title: 'title',
          description: 'description',
          isCompleted: false,
          dueDate: DateTime.now()),
      Todo(
          id: const TodoId(value: 1),
          title: 'title' * 50,
          description: 'description',
          isCompleted: true,
          dueDate: DateTime.now()),
    ]);
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: todoList.length,
      itemBuilder: (final BuildContext context, final int index) {
        if (todoList.length == 0) {
          return const Center(child: Text('No ToDos'));
        } else {
          return _buildTodoItemCardWidget(todoList[index]);
        }
      },
    );
  }

  Widget _buildTodoItemCardWidget(final Todo todo) {
    return Card(
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
                  Text(
                    todo.description,
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
    );
  }

  Widget _buildCheckedIcon(final Todo todo) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightGreen),
        child: const Icon(Icons.check, size: 12, color: Colors.white),
      ),
      onTap: () => _viewModel.undoTodo(todo),
    );
  }

  Widget _buildUncheckedIcon(final Todo todo) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: const SizedBox(width: 22, height: 22),
      ),
      onTap: () => _viewModel.completeTodo(todo),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => null,
      child: const Icon(Icons.add),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('An error has occurred!'));
  }
}
