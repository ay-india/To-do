import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  Button({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(name),
      color: Colors.green[300],
    );
  }
}
