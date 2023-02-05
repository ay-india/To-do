import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  final _mybox = Hive.box('mybox');
  //for 1st time user
  void newUserData() {
    todoList = [
      ['Make To-Do', false],
      ['Aim big', false],
    ];
  }

  void loadData() {
    todoList = _mybox.get('ToDoList');
  }

  void updateData() {
    _mybox.put('ToDoList', todoList);
  }
}
