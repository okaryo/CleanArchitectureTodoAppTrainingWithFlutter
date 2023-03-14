import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKind { all, completed, incomplete }

final filterKindProvider =
    StateNotifierProvider.autoDispose<FilterKindViewModel, FilterKind>(
  (_) => FilterKindViewModel(),
);

class FilterKindViewModel extends StateNotifier<FilterKind> {
  FilterKindViewModel() : super(FilterKind.all);

  filterByAll() => state = FilterKind.all;
  bool isFilteredByAll() => state == FilterKind.all;

  filterByCompleted() => state = FilterKind.completed;
  bool isFilteredByCompleted() => state == FilterKind.completed;

  filterByIncomplete() => state = FilterKind.incomplete;
  bool isFilteredByIncomplete() => state == FilterKind.incomplete;
}
