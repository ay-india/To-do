import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/todo_tile.dart';

import '../utils/dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Refernce our Box
  final _mybox = Hive.box('mybox');

  final _controller = TextEditingController();

  @override
  void initState() {
    //if first time onpening the app then open default data.
    if (_mybox.get('ToDoList') == null) {
      db.newUserData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  ToDoDatabase db = ToDoDatabase();

  checkedBoxTap(bool value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
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
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        title: Text('To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (ctx, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskStatus: db.todoList[index][1],
              onChanged: (value) => checkedBoxTap(value!, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
