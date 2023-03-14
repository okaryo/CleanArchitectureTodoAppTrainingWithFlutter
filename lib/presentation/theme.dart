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
      brightness: brightness,
    );
  }

  ThemeData light() {
    final colors = ColorScheme.fromSeed(
      seedColor: source,
      brightness: Brightness.light,
    );
    final root = _base(Brightness.light).copyWith(
      brightness: Brightness.light,
      colorScheme: colors,
    );
    return root.copyWith(
      textTheme: root.textTheme.withColor(colors.onSurface),
    );
  }

  ThemeData dark() {
    final colors = ColorScheme.fromSeed(
      seedColor: source,
      brightness: Brightness.dark,
    );
    final root = _base(Brightness.dark).copyWith(
      brightness: Brightness.dark,
      colorScheme: colors,
    );
    return root.copyWith(
      textTheme: root.textTheme.withColor(colors.onSurface),
    );
  }
}

extension on TextTheme {
  TextTheme withColor(Color value) {
    return copyWith(
      displayLarge: displayLarge!.copyWith(color: value),
      displayMedium: displayMedium!.copyWith(color: value),
      displaySmall: displaySmall!.copyWith(color: value),
      headlineLarge: headlineLarge!.copyWith(color: value),
      headlineMedium: headlineMedium!.copyWith(color: value),
      headlineSmall: headlineSmall!.copyWith(color: value),
      bodyLarge: bodyLarge!.copyWith(color: value),
      bodyMedium: bodyMedium!.copyWith(color: value),
      bodySmall: bodySmall!.copyWith(color: value),
      titleLarge: titleLarge!.copyWith(color: value),
      titleMedium: titleMedium!.copyWith(color: value),
      titleSmall: titleSmall!.copyWith(color: value),
      labelLarge: labelLarge!.copyWith(color: value),
      labelMedium: labelMedium!.copyWith(color: value),
      labelSmall: labelSmall!.copyWith(color: value),
    );
  }
}
