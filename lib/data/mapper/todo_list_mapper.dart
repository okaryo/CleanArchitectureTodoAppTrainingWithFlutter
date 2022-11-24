import '../entity/todos_entity.dart';
import 'todo_mapper.dart';
import '../../domain/model/todo_list.dart';

class TodoListMapper {
  static TodoList transformToModel(final TodoListEntity entities) {
    final values =
        entities.map((entity) => TodoMapper.transformToModel(entity)).toList();
    return TodoList(values: values);
  }

  static TodoListEntity transformToMap(final TodoList model) =>
      model.values.map((value) => TodoMapper.transformToMap(value)).toList();
}
