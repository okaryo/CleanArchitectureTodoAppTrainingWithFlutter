import 'package:clean_architecture_todo_app/data/data_module.dart';
import 'package:clean_architecture_todo_app/domain/domain_module.dart';
import 'package:clean_architecture_todo_app/presentation/presentation_module.dart';
import 'package:clean_architecture_todo_app/presentation/view/todo_list_page.dart';
import 'package:dain/dain.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  Dain.start([
    DomainModule(),
    DataModule(),
    PresentationModule(),
  ]);

  runApp(
    ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(),
    );
  }
}
