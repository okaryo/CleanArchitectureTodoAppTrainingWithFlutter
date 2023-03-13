import 'presentation/view/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const source = Colors.green;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(source, Brightness.light),
      darkTheme: buildTheme(source, Brightness.dark),
      themeMode: ThemeMode.system,
      home: TodoListPage(),
    );
  }

  ThemeData buildTheme(Color source, Brightness brightness) {
    final base = brightness == Brightness.light
        ? ThemeData.light(useMaterial3: true)
        : ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: source,
        brightness: brightness,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }
}
