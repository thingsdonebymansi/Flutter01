import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List TodoList = [];

  final _myBox = Hive.box("mybox");

  void createData() {
    TodoList = [
      ["TODO1", false],
      ["TODO2", false],
    ];
  }

  void loadData(){
    TodoList = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", TodoList);
  }

  
}
