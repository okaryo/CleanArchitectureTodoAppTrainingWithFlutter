import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKind { all, completed, incomplete }

final filterKindProvider =
    StateNotifierProvider.autoDispose<FilterKindViewModel, FilterKind>(
  (_) => FilterKindViewModel(),
);

class FilterKindViewModel extends StateNotifier<FilterKind> {
  FilterKindViewModel() : super(FilterKind.all);

  void filterByAll() => state = FilterKind.all;
  bool isFilteredByAll() => state == FilterKind.all;

  void filterByCompleted() => state = FilterKind.completed;
  bool isFilteredByCompleted() => state == FilterKind.completed;

  void filterByIncomplete() => state = FilterKind.incomplete;
  bool isFilteredByIncomplete() => state == FilterKind.incomplete;
}
