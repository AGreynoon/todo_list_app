import 'package:todo_list_app/models/task.dart';

class TaskManager {
  final List<Task> uncompletedTasks = [];
  final List<Task> completedTasks = [];

  void addTask(Task newTask) {
    uncompletedTasks.add(newTask);
  }

  void markTaskAsCompleted(int index) {
    final task = uncompletedTasks.removeAt(index);
    task.isCompleted = true;
    completedTasks.add(task);
  }

  void deleteTask(int index) {
    uncompletedTasks.removeAt(index);
  }

  void updateTask(int index, Task updatedTask) {
    uncompletedTasks[index] = updatedTask;
  }
}
