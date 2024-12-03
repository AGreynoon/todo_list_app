import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class TaskManager extends ChangeNotifier {
  final List<Task> uncompletedTasks = [];
  final List<Task> completedTasks = [];

  void addTask(Task newTask) {
    uncompletedTasks.add(newTask);
    notifyListeners();
  }

  void markTaskAsCompleted(int index) {
    final task = uncompletedTasks.removeAt(index);
    task.isCompleted = true;
    completedTasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    uncompletedTasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(int index, Task updatedTask) {
    uncompletedTasks[index] = updatedTask;
    notifyListeners();
  }
}
