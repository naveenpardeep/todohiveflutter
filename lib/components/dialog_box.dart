import 'package:flutter/material.dart';
import 'package:todo/components/task_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 93, 78, 121),
      content: SizedBox(
        height: 200,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            style: TextStyle(color: Colors.white),
            controller: controller,
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(),
                hintText: "Enter your task...",
                hintStyle: TextStyle(color: Colors.white)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TaskButton(text: "Add", onPressed: onSave),
              TaskButton(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
