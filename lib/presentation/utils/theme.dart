import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme(this.source);
  final Color source;
  final ThemeMode mode = ThemeMode.system;

  ThemeData _base(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  ThemeData light() {
    return _base(Brightness.light).copyWith(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: source,
        brightness: Brightness.light,
      ),
    );
  }

  ThemeData dark() {
    return _base(Brightness.dark).copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: source,
        brightness: Brightness.dark,
      ),
    );
  }
}
