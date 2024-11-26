import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/widgets/completed_task_card.dart';

class CompletedTask extends StatefulWidget {
  final TaskManager taskManager;
  CompletedTask({required this.taskManager, super.key});

  @override
  State<CompletedTask> createState() {
    debugPrint('CompletedTask createState runs');
    return _CompletedTaskState();
  }
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
    debugPrint('CompletedTask createState runs');
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
      body: ListView.builder(
        itemCount: widget.taskManager.completedTasks.length,
        itemBuilder: (context, index) {
          return CompletedTaskcard(
              task: widget.taskManager.completedTasks[index]);
        },
      ),
    );
  }
}
