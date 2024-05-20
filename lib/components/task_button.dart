import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  TaskButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.lightBlue[300],
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
