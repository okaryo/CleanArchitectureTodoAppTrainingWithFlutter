import '../entity/todos_entity.dart';
import '../../domain/model/todo.dart';
import '../../domain/model/todo_id.dart';

class TodoMapper {
  static Todo transformToModel(final TodoEntity entity) {
    return Todo(
      id: TodoId(value: entity['id']),
      title: entity['title'],
      description: entity['description'],
      isCompleted: entity['is_completed'] == 1,
      dueDate: DateTime.parse(entity['due_date']),
    );
  }

  static TodoEntity transformToMap(final Todo model) {
    return {
      'id': model.id.value,
      'title': model.title,
      'description': model.description,
      'is_completed': model.isCompleted ? 1 : 0,
      'due_date': model.dueDate.toIso8601String(),
    };
  }

  static TodoEntity transformToNewEntityMap(
    final String title,
    final String description,
    final bool isCompleted,
    final DateTime dueDate,
  ) {
    return {
      'id': null,
      'title': title,
      'description': description,
      'is_completed': isCompleted ? 1 : 0,
      'due_date': dueDate.toIso8601String(),
    };
  }
}
