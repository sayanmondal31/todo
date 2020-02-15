import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get totalTask {
    return _tasks.length;
  }

  void addTask(String updatedDatalist) {
    final task = Task(name: updatedDatalist);
    _tasks.add(task);
    notifyListeners();
  }

  void checkBoxtick(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
  }
}
