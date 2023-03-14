import 'package:go_router/go_router.dart';

import 'view/search_todo_list.dart';
import 'view/todo_details.dart';
import 'view/todo_list.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TodoListPage(),
      routes: [
        GoRoute(
          path: 'todo/:id',
          builder: (context, state) => TodoDetails(id: state.params['id']!),
        ),
        GoRoute(
          path: 'search',
          builder: (context, state) => const SearchTodoList(),
        ),
      ],
    ),
  ],
);
