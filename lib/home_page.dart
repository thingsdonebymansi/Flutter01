import 'package:flutter/material.dart';
import 'package:myapp/utils/dialog_box.dart';
import 'package:myapp/utils/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  List TodoList = [
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
    ["TODO", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  void onChanged(bool? value) {
    setState(() {});
  }

  void saveNewTask() {
    setState(() {
      TodoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Text("TODO", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple[400],
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TodoItem(
            isChecked: TodoList[index][1],
            todoText: TodoList[index][0],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
        itemCount: TodoList.length,
      ),
    );
  }
}
