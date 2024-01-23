import 'package:equatable/equatable.dart';

class TodoEntities extends Equatable {
  final int id;
  final String todo;
  final int userId;
  final bool completed;

  const TodoEntities({
    required this.id,
    required this.todo,
    required this.userId,
    required this.completed,
  });

  TodoEntities copyWith({
    int? id,
    String? todo,
    int? userId,
    bool? completed,
  }) {
    return TodoEntities(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      userId: userId ?? this.userId,
      completed: completed ?? this.completed,
    );
  }

  @override
  String toString() {
    return 'TodoEntities{id: $id, todo: $todo, userId: $userId, completed: $completed}';
  }

  @override
  List<Object?> get props => [
        id,
        todo,
        userId,
        completed,
      ];
}
