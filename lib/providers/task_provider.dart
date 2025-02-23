import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/models/task_model.dart';

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]);

  void addTask(String newTitle, String newDetail) {
    state = [...state, TaskModel(title: newTitle, detail: newTitle)];
  }

  //* nother way of updating task

  // void updateTask(String title,
  //     {required String newTitle, required String newDetail}) {
  //   final index = state.indexWhere((task) => task.title == title);
  //   if (index == -1) {
  //     return; // Task not found, do nothing
  //   } else {
  //     final updatedTask = state[index].copyWith(
  //       title: newTitle,
  //       detail: newDetail,
  //     );
  //     state = [
  //       ...state.sublist(0, index), // Keep tasks before the updated task
  //       updatedTask, // Insert updated task
  //       ...state.sublist(index + 1), // Keep tasks after the updated task
  //     ];
  //   }
  // }

  void updateTask(String title,
      {required String newTitle, required String newDetail}) {
    state = state.map((task) {
      if (task.title == title) {
        return task.copyWith(title: newTitle, detail: newDetail);
      }
      return task;
    }).toList();
  }

  void deleteTask(String title) {
    final index = state.indexWhere((task) => task.title == title);

    state = [
      ...state.sublist(0, index),
      ...state.sublist(index + 1),
    ];
  }

  //* nother way of deleting task

  // void deleteTask(String title) {
  //   state = state.where((task) => task.title != title).toList();
  // }

  //* nother way of marking task as completed

  // void markTaskAsCompleted(String title) {
  //   state = state.map((task) {
  //     if (task.title == title) {
  //       return task.copyWith(isCompleted: !task.isCompleted);
  //     }
  //     return task;
  //   }).toList();
  // }

  void markTaskAsCompleted(String title) {
    final index = state.indexWhere((task) => task.title == title);
    if (index == -1) {
      return;
    } else {
      final completedTask = state[index].copyWith(
        isCompleted: true,
      );
      state = [
        ...state.sublist(0, index),
        completedTask,
        ...state.sublist(index + 1),
      ];
    }
  }
}

//? for CRUD operations
final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, List<TaskModel>>((ref) {
  return TaskNotifier();
});

//? for displaying completed tasks
final completedTasksNotifierProvider = Provider<List<TaskModel>>((ref) {
  final tasks = ref.watch(taskNotifierProvider);
  return tasks.where((task) => task.isCompleted).toList();
});

//? for displaying uncompleted tasks in all tasks view
final uncompletedTasksNotifierProvider = Provider<List<TaskModel>>((ref) {
  final tasks = ref.watch(taskNotifierProvider);
  return tasks.where((task) => !task.isCompleted).toList();
});
