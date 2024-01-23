import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:retry_api/config/enum/bloc_api_state.dart';
import 'package:retry_api/features/todos/data/models/todo_model.dart';
import 'package:retry_api/features/todos/domain/entities/todo_entities.dart';
import 'package:retry_api/features/todos/domain/usecases/todos.dart';

part 'todo_state.dart';

class TodoCubit extends HydratedCubit<TodoState> {
  final TodosUseCase todosUseCase;

  TodoCubit({required this.todosUseCase})
      : super(
          const TodoState(
              todos: [],
              apiState: NormalApiState.initial,
              errorMessage: "Please Swipe Down to Refresh"),
        );

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    // Check which state is saved in the json and return the corresponding state
    try {
      final todos = (json['todos'] as List<dynamic>)
          .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return TodoState(
          todos: todos, apiState: NormalApiState.loaded, errorMessage: "");
    } catch (_) {
      return const TodoState(
          todos: [],
          apiState: NormalApiState.initial,
          errorMessage: "Please Swipe Down to Refresh");
    }
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    // Check which state is passed and save the corresponding json
    return {
      'todos': state.todos.map((e) => (e as TodoModel).toJson()).toList(),
    };
  }

  Future<void> getTodos() async {
    emit(state.copyWith(apiState: NormalApiState.loading));
    await todosUseCase.getTodos().then((todos) {
      emit(state.copyWith(
          todos: todos, apiState: NormalApiState.loaded, errorMessage: ""));
    }).onError((error, stackTrace) {
      emit(
        state.copyWith(
            apiState: NormalApiState.failure, errorMessage: error.toString()),
      );
    });
  }
}
