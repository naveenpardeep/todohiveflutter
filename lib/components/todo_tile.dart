import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isComplete;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteTask;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.isComplete,
      required this.onChange,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: isComplete,
                onChanged: onChange,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.white,
                    decoration: isComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
