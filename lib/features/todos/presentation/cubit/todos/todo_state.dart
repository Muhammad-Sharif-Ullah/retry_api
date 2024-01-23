part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<TodoEntities> todos;
  final NormalApiState apiState;
  final String errorMessage;

  const TodoState(
      {required this.todos,
      required this.apiState,
      required this.errorMessage});

  @override
  List<Object?> get props => [todos, apiState, errorMessage];

  TodoState copyWith({
    List<TodoEntities>? todos,
    NormalApiState? apiState,
    String? errorMessage,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// final class TodoList extends TodoState {
//   const TodoList({
//     required List<TodoEntities> todos,
//     required NormalApiState apiState,
//     required String errorMessage,
//   }) : super(
//           todos: todos,
//           apiState: apiState,
//           errorMessage: errorMessage,
//         );
//   @override
//   List<Object?> get props => [todos, apiState, errorMessage];

//   TodoList copyWith({
//     List<TodoEntities>? todos,
//     NormalApiState? apiState,
//     String? errorMessage,
//   }) {
//     return TodoList(
//       todos: todos ?? this.todos,
//       apiState: apiState ?? this.apiState,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
// }
