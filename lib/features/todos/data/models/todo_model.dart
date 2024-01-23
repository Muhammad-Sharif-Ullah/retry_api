import 'package:retry_api/features/todos/domain/entities/todo_entities.dart';

class TodoModel extends TodoEntities {
  const TodoModel({
    required int id,
    required String todo,
    required int userId,
    required bool completed,
  }) : super(
          id: id,
          todo: todo,
          userId: userId,
          completed: completed,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        todo: json['todo'],
        userId: json['userId'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
        'userId': userId,
        'completed': completed,
      };
}
