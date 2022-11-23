import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/todolist/filter_kind_viewmodel.dart';

class ChipsBarWidget extends StatelessWidget {
  final _provider = filterKindViewModelStateNotifierProvider;

  @override
  Widget build(final BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final viewModel = watch(_provider.notifier);
        watch(_provider);
        return SizedBox(
          height: kToolbarHeight,
          child: ListView(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 3,
              bottom: 3,
            ),
            scrollDirection: Axis.horizontal,
            children: [
              buildChip(
                context,
                viewModel.isFilteredByAll(),
                'All',
                viewModel.filterByAll,
              ),
              const SizedBox(width: 8),
              buildChip(
                context,
                viewModel.isFilteredByCompleted(),
                'Completed',
                viewModel.filterByCompleted,
              ),
              const SizedBox(width: 8),
              buildChip(
                context,
                viewModel.isFilteredByIncomplete(),
                'Incomplete',
                viewModel.filterByIncomplete,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildChip(
    BuildContext context,
    bool checked,
    String label,
    VoidCallback onSelect,
  ) {
    return InputChip(
      showCheckmark: checked,
      label: Text(label),
      selected: checked,
      onSelected: (_) => onSelect(),
      selectedColor: checked ? Theme.of(context).colorScheme.tertiary : null,
      labelStyle: checked
          ? TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
            )
          : null,
      checkmarkColor: checked ? Theme.of(context).colorScheme.onTertiary : null,
    );
  }
}
