import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterKind { all, completed, incomplete }

final filterKindViewModelStateNotifierProvider =
    StateNotifierProvider.autoDispose<FilterKindViewModel, FilterKind>((_) => FilterKindViewModel());

class FilterKindViewModel extends StateNotifier<FilterKind> {
  FilterKindViewModel() : super(FilterKind.all);

  filterByAll() => state = FilterKind.all;

  filterByCompleted() => state = FilterKind.completed;

  filterByIncomplete() => state = FilterKind.incomplete;

  bool isFilteredByAll() => state == FilterKind.all;

  bool isFilteredByCompleted() => state == FilterKind.completed;

  bool isFilteredByIncomplete() => state == FilterKind.incomplete;
}
