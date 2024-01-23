import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retry_api/core/theme/app_theme.dart';
import 'package:retry_api/features/Home/presentation/pages/home_page.dart';
import 'package:retry_api/features/todos/presentation/cubit/todos/todo_cubit.dart';

import 'core/di/dependency_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --------------Dependencies Injector ----------------------------
  await configureDependencies();
  // --------------Dependencies Injector end-------------------------

  // --------------Hydrated Bloc----------------------------
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // --------------Hydrated Bloc end------------------------

  // --------------Error handling---------------------------
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  // --------------Error handling end-----------------------

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (context) => sl<TodoCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'API Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme(textTheme),
        darkTheme: AppTheme.darkTheme(textTheme),
        home: const HomePage(),
      ),
    );
  }
}
