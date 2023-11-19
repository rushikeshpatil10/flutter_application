import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodoEvents {}

class TodoHandler extends Bloc<TodoEvents, List<String>> {
  TodoHandler() : super(<String>[]) {}
  addTodo(String todo) {
    state.add(todo);
    emit(List.from(state));
  }

  removeTodo(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }
}
