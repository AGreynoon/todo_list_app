import 'package:todo_list_app/models/task.dart';

class TaskManager {
  List<Task> uncompletedTasks = [];
  List<Task> completedTasks = [];

  void addTask(Task task) {
    uncompletedTasks.add(task);
  }

  void markTaskAsCompleted(int index) {
    final task = uncompletedTasks.removeAt(index);
    task.markAsCompleted();
    completedTasks.add(task);
  }

  void deleteTask(int index) {
    uncompletedTasks.removeAt(index);
  }

  void updateTask(int index, Task updatedTask) {
    uncompletedTasks[index] = updatedTask;
  }
}
