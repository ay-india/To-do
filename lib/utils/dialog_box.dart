import 'package:flutter/material.dart';
import 'package:todo_app/utils/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 140,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                  name: 'Save',
                  onPressed: controller.text == '' ? onCancel : onSave),
              SizedBox(
                width: 5,
              ),
              Button(name: 'Cancel', onPressed: onCancel),
            ],
          )
        ]),
      ),
    );
  }
}
