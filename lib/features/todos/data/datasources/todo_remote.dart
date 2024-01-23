import 'dart:developer';

import 'package:retry_api/core/network/dio_client/client.dart';
import 'package:retry_api/core/network/dio_client/request_params.dart';
import 'package:retry_api/features/todos/data/models/todo_model.dart';

class TodoRemoteServices {
  final DioClient _dioClient = DioClient.instance;

  Future<List<TodoModel>> getTodos() async {
    final APIRequestParam param = APIRequestParam(
      path: '/todos',
      doCache: false,
    );
    return await _dioClient.get(param).then((response) {
      return response.fold((l) {
        log("Exception : $l");
        throw l;
      }, (r) {
        try {
          final List<TodoModel> todos = List.from(r.data['todos'])
              .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
              .toList();
          return todos;
        } on Exception catch (e) {
          throw e;
        }
      });
    });
  }
}
