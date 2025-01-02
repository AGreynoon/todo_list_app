import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/task_provider.dart';
import 'package:todo_list_app/widgets/completed_task_card_widget.dart';

class CompletedTaskView extends StatelessWidget {
  const CompletedTaskView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TaskProvider>(builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.completedTasks.length,
            itemBuilder: (context, index) {
              return CompletedTaskCardWidget(
                task: task.completedTasks[index],
              );
            },
          );
        }),
      ),
    );
  }
}
