import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_state_management_example/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<TaskModel> _tasks = [];

  UnmodifiableListView<TaskModel> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void add(String name) {
    _tasks.add(TaskModel(name: name));
    notifyListeners();
  }

  void update(TaskModel task) {
    task.toggleDone();
    notifyListeners();
  }

  void delete(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}