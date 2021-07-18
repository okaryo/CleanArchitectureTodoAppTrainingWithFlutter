import 'package:clean_architecture_todo_app/presentation/viewmodel/todolist/filter_kind.dart';
import 'package:state_notifier/state_notifier.dart';

class FilterKindStateController extends StateNotifier<FilterKind> {
  static FilterKindStateController? _instance;

  factory FilterKindStateController() {
    return _instance ??= FilterKindStateController._();
  }

  FilterKindStateController._() : super(FilterKind.all);

  changeFilterKind(final FilterKind filterKind) => state = filterKind;

  bool isCurrentFilterKind(final FilterKind filterKind) => filterKind == state;
}
