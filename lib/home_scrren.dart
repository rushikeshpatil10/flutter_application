import 'package:flutter/material.dart';
import 'package:flutter_application/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoHandler taskBloc = BlocProvider.of<TodoHandler>(context);
    TextEditingController _controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo List'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _controller,
              ),
            ),
            TextButton(
                onPressed: () {
                  taskBloc.addTodo(_controller.text);
                },
                child: Text('Submit')),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              child: BlocBuilder<TodoHandler, List<String>>(
                  builder: (context, state) {
                return ListView.builder(
                  itemBuilder: (context, i) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(state[i]),
                          GestureDetector(
                              onTap: () {
                                taskBloc.removeTodo(i);
                              },
                              child: Icon(Icons.delete))
                        ]);
                  },
                  itemCount: state.length,
                );
              }),
            )
          ],
        ));
  }
}
