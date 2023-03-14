import 'package:flutter/material.dart';

typedef Breakpoint = double;

class BreakpointWidget extends StatelessWidget {
  const BreakpointWidget({
    super.key,
    required this.builder,
    this.breakpoints = const {},
  });

  final WidgetBuilder builder;
  final Map<Breakpoint, WidgetBuilder> breakpoints;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        for (final entry in breakpoints.entries) {
          if (width > entry.key) {
            return entry.value(context);
          }
        }
        return builder(context);
      },
    );
  }
}
