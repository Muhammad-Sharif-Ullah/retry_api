import 'package:retry_api/features/todos/data/datasources/todo_remote.dart';
import 'package:retry_api/features/todos/data/models/todo_payload.dart';
import 'package:retry_api/features/todos/domain/entities/todo_entities.dart';
import 'package:retry_api/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoRemoteServices todoRemoteServices;

  TodoRepositoryImpl({required this.todoRemoteServices});

  @override
  Future<TodoEntities> addTodo({required TodoPayload payload}) async {
    // TODO: implement clearTodo
    throw UnimplementedError();
  }

  @override
  Future<String> clearTodo({required TodoPayload payload}) {
    // TODO: implement clearTodo
    throw UnimplementedError();
  }

  @override
  Future<String> completeTodo({required TodoPayload payload}) {
    // TODO: implement completeTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntities>> getTodos() async {
    return await todoRemoteServices.getTodos().then((response) {
      return response;
    }).onError((error, stackTrace) {
      throw error.toString();
    });
  }

  @override
  Future<List<TodoEntities>> loadMoreTodo() {
    // TODO: implement loadMoreTodo
    throw UnimplementedError();
  }

  @override
  Future<String> removeTodo({required TodoPayload payload}) {
    // TODO: implement removeTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoEntities> updateTodo({required TodoPayload payload}) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
