// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'breakpoint.dart';

typedef DetailBuilder<T> = Widget Function(BuildContext context, T item);
typedef ListBuilder<T> = Widget Function(BuildContext context, List<T> items,
    T? selected, ValueChanged<T?> onSelect);

class MasterDetailWidget<T> extends HookWidget {
  const MasterDetailWidget({
    required this.items,
    required this.listBuilder,
    required this.detailBuilder,
    required this.emptyBuilder,
    this.breakpoint = 800,
    this.listWidth = 300,
  });

  final List<T> items;
  final ListBuilder<T> listBuilder;
  final DetailBuilder<T> detailBuilder;
  final WidgetBuilder emptyBuilder;
  final double breakpoint;
  final double listWidth;

  @override
  Widget build(BuildContext context) {
    final selected = useState<T?>(null);

    void onSelect(value) {
      selected.value = value;
    }

    return BreakpointWidget(
      builder: (context) {
        return listBuilder(context, items, null, (value) {
          if (value == null) return;
          final details = detailBuilder(context, value);
          final nav = Navigator.of(context);
          nav.push(MaterialPageRoute(builder: (context) => details));
        });
      },
      breakpoints: {
        breakpoint: (context) {
          return Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                ),
                width: listWidth,
                child: listBuilder(context, items, selected.value, onSelect),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final value = selected.value;
                    if (value == null) {
                      return emptyBuilder(context);
                    } else {
                      return detailBuilder(context, value);
                    }
                  },
                ),
              ),
            ],
          );
        },
      },
    );
  }
}
