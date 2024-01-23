import 'package:retry_api/features/todos/data/models/todo_payload.dart';
import 'package:retry_api/features/todos/domain/entities/todo_entities.dart';

abstract class TodoRepository {
  Future<List<TodoEntities>> getTodos();
  Future<TodoEntities> addTodo({required final TodoPayload payload});
  Future<String> removeTodo({required final TodoPayload payload});
  Future<TodoEntities> updateTodo({required final TodoPayload payload});
  Future<String> completeTodo({
    required final TodoPayload payload,
  });
  Future<String> clearTodo({
    required final TodoPayload payload,
  });
  Future<List<TodoEntities>> loadMoreTodo();
}
