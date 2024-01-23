import 'package:retry_api/features/todos/data/models/todo_payload.dart';
import 'package:retry_api/features/todos/domain/entities/todo_entities.dart';
import 'package:retry_api/features/todos/domain/repositories/todo_repository.dart';

class TodosUseCase {
  final TodoRepository todoRepository;

  TodosUseCase({required this.todoRepository});
  Future<List<TodoEntities>> getTodos() async {
    return await todoRepository.getTodos();
  }

  Future<TodoEntities> addTodos({required final TodoPayload todo}) async {
    return await todoRepository.addTodo(payload: todo);
  }

  Future<String> deleteTodos({required final TodoPayload todo}) async {
    return await todoRepository.removeTodo(
      payload: todo,
    );
  }

  Future<TodoEntities> updateTodos({required final TodoPayload todo}) async {
    return await todoRepository.updateTodo(
      payload: todo,
    );
  }

  Future<String> completeTodos({required final TodoPayload todo}) async {
    return await todoRepository.completeTodo(
      payload: todo,
    );
  }

  Future<String> unCompleteTodos({required final TodoPayload todo}) async {
    return await todoRepository.clearTodo(
      payload: todo,
    );
  }

  Future<String> clearCompletedTodos({required final TodoPayload todo}) async {
    return await todoRepository.clearTodo(
      payload: todo,
    );
  }

  Future<List<TodoEntities>> loadMoreTodos() async {
    return await todoRepository.loadMoreTodo();
  }
}
