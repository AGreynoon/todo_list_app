import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> uncompletedTasks = [];
  final List<TaskModel> completedTasks = [];

  void addTask(TaskModel newTask) {
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

  void updateTask(int index, TaskModel updatedTask) {
    uncompletedTasks[index] = updatedTask;
    notifyListeners();
  }
}
