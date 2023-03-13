// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.dueDate,
  });

  final int id;
  final String title;
  final String? description;
  final bool isCompleted;
  final DateTime dueDate;

  @override
  List<Object?> get props => [id, title, description, isCompleted, dueDate];

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}

extension TodosExtension on List<Todo> {
  List<Todo> filterByCompleted() {
    return where((todo) => todo.isCompleted).toList();
  }

  List<Todo> filterByIncomplete() {
    return where((todo) => !todo.isCompleted).toList();
  }
}
