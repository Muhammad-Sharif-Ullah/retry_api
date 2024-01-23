import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retry_api/config/enum/bloc_api_state.dart';
import 'package:retry_api/features/todos/presentation/cubit/todos/todo_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state.apiState == NormalApiState.failure &&
              state.todos.isNotEmpty) {
            // snackbar
            ScaffoldMessenger.maybeOf(context)?.showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          switch (state.apiState) {
            case NormalApiState.initial:
              return Center(
                child: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center),
              );

            case NormalApiState.loading:
              if (state.todos.isNotEmpty) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(
                            state.todos[index].todo,
                          ),
                          trailing: Checkbox(
                            value: state.todos[index].completed,
                            onChanged: (value) {
                              // context.read<TodoCubit>().updateTodo(
                              //     id: state.todos[index].id,
                              //     isCompleted: value ?? false);
                            },
                          )),
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());

            case NormalApiState.loaded:
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<TodoCubit>().getTodos();
                },
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(8),
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text(
                            state.todos[index].todo,
                          ),
                          trailing: Checkbox(
                            value: state.todos[index].completed,
                            onChanged: (value) {
                              // context.read<TodoCubit>().updateTodo(
                              //     id: state.todos[index].id,
                              //     isCompleted: value ?? false);
                            },
                          )),
                    );
                  },
                ),
              );

            case NormalApiState.failure:
              if (state.todos.isNotEmpty) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<TodoCubit>().getTodos();
                  },
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                              state.todos[index].todo,
                            ),
                            trailing: Checkbox(
                              value: state.todos[index].completed,
                              onChanged: (value) {
                                // context.read<TodoCubit>().updateTodo(
                                //     id: state.todos[index].id,
                                //     isCompleted: value ?? false);
                              },
                            )),
                      );
                    },
                  ),
                );
              }
              return Center(
                child: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center),
              );

            default:
              return Center(
                child: Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center),
              );
          }
        },
      ),
    );
  }
}
