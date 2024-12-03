import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/widgets/completed_task_card.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D7EF),
      appBar: AppBar(
        title: const Text(
          'Completed Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Jost',
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: const Color(0xFF9395D3),
        elevation: 0,
      ),
      body: Consumer<TaskManager>(builder: (context, task, child) {
        return ListView.builder(
          itemCount: task.completedTasks.length,
          itemBuilder: (context, index) {
            return CompletedTaskcard(
              task: task.completedTasks[index],
            );
          },
        );
      }),
    );
  }
}
