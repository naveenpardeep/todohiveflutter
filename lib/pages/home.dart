import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/db/db.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // reference the box
  final _todosBox = Hive.box("todos");
  DB todosDB = DB();

  @override
  void initState() {
    // If this is the first time ever opening the app create initial data
    if (_todosBox.get("TODOLIST") == null) {
      todosDB.createInitialData();
    } else {
      // means the app has already some user data
      todosDB.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void onCheckboxChange(bool? value, int index) {
    setState(() {
      todosDB.todos[index][1] = !todosDB.todos[index][1];
      todosDB.updateData();
    });
  }

  void saveNewTask() {
    setState(() {
      todosDB.todos.add([_controller.text, false]);
      todosDB.updateData();
    });

    _controller.text = "";

    Navigator.pop(context);
  }

  void onDeleteTask(int index) {
    setState(() {
      todosDB.todos.removeAt(index);
      todosDB.updateData();
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () {
              _controller.text = "";
              Navigator.pop(context);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 78, 121),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 93, 78, 121),
        title: const Text(
          "ToDo test LLC Abol",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todosDB.todos.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todosDB.todos[index][0],
            isComplete: todosDB.todos[index][1],
            onChange: (value) => onCheckboxChange(value, index),
            deleteTask: (value) => onDeleteTask(index),
          );
        },
      ),
    );
  }
}
