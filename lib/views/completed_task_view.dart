import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/task_provider.dart';
import 'package:todo_list_app/widgets/completed_task_card_widget.dart';

class CompletedTaskView extends ConsumerWidget {
  const CompletedTaskView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedTasks = ref.watch(completedTasksNotifierProvider);
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
        child: ListView.builder(
          itemCount: completedTasks.length,
          itemBuilder: (context, index) {
            return CompletedTaskCardWidget(
              title: completedTasks[index].title,
              detail: completedTasks[index].detail,
            );
          },
        ),
      ),
    );
  }
}
