import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const theme = AppTheme(Colors.green);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: theme.mode,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
