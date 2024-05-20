import 'package:hive_flutter/hive_flutter.dart';

class DB {
  List todos = [];

  // reference the box
  final _todosBox = Hive.box("todos");

  // run the below method when it's 1st time ever running the app
  Future<void> createInitialData() async {
    todos = [
      ["Test task 1 LLC Abol", false],
      ["Test task 2 LLC Abol", false],
      ["Test task 3 LLC Abol", true],
    ];
  }

  void loadData() {
    todos = _todosBox.get("TODOLIST");
  }

  void updateData() {
    _todosBox.put("TODOLIST", todos);
  }
}
