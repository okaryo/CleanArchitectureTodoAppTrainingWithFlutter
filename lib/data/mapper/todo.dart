import '../../domain/model/todo.dart';
import '../entity/todo.dart';

class TodoMapper {
  static Todo transformToModel(TodoEntity entity) {
    return Todo(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      isCompleted: entity.isCompleted == 1,
      dueDate: DateTime.parse(entity.dueDate),
    );
  }

  static List<Todo> transformToModelList(List<TodoEntity> entities) {
    return entities.map((e) => transformToModel(e)).toList();
  }
}
