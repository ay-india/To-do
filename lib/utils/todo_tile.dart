import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskStatus,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.22,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              // padding: const EdgeInsets.fromLTRB(, 1, 10, 1),
              flex: 4,
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(14),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskStatus,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskStatus
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
