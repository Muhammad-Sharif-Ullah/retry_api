import 'package:get_it/get_it.dart';
import 'package:retry_api/features/todos/data/datasources/todo_remote.dart';
import 'package:retry_api/features/todos/data/repositories/todo_repository_impl.dart';
import 'package:retry_api/features/todos/domain/repositories/todo_repository.dart';
import 'package:retry_api/features/todos/domain/usecases/todos.dart';
import 'package:retry_api/features/todos/presentation/cubit/todos/todo_cubit.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await _todos();
}

// Todo : Add your dependencies here
Future<void> _todos() async {
  // todos cubit
  sl.registerFactory<TodoCubit>(() => TodoCubit(todosUseCase: sl()));
  // todos use-case
  sl.registerLazySingleton(() => TodosUseCase(todoRepository: sl()));
  // Todo : Add your repositories here
  sl.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(todoRemoteServices: sl()));
  // Todo : Add your data sources here
  sl.registerLazySingleton(() => TodoRemoteServices());
}
