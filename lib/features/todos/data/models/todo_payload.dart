class TodoPayload {
  final String todo;
  final String completed;
  final String userId;

  TodoPayload({
    required this.todo,
    required this.completed,
    required this.userId,
  });
  // to json
  Map<String, dynamic> toJson() => {
        'todo': todo,
        'completed': completed,
        'userId': userId,
      };
}
