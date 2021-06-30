import 'package:clean_architecture_todo_app/data/entity/todos_entity.dart';
import 'package:clean_architecture_todo_app/domain/model/todo.dart';
import 'package:clean_architecture_todo_app/domain/model/todo_id.dart';

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
}
