import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/model/models/task.dart';

class TheTaskData extends ChangeNotifier {
  

  

  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy ketchup'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  // Widget addTasks(BuildContext context) {
  //   return AddTaskScreen((newTaskTitle) {
  //     tasks.add(
  //       Task(name: newTaskTitle),
  //     );
  //     Navigator.pop(context);

  //     notifyListeners();
  //   });
  // }

  

}