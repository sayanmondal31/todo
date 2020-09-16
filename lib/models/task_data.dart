import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> _completedTask = [];


  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get completdTasks => UnmodifiableListView(_completedTask);
  
  int get totalTask => _tasks.length;
  int get completeTotalTask => _completedTask.length;

  void addTask(String updatedDatalist) {
    final task = Task(name: updatedDatalist);
    _tasks.add(task);
    notifyListeners();
  }

  

  void checkBoxtick(Task task) {
    task.toggledone();
    task.isdone?_completedTask.add(task):_completedTask.remove(task);
    print(_completedTask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    _completedTask.remove(task);
    notifyListeners();
  }

  void deleteAll() {
    _tasks.clear();
    _completedTask.clear();
    notifyListeners();
  }
}
