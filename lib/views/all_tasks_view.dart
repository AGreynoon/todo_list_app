import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/task_provider.dart';
import 'package:todo_list_app/views/add_task_view.dart';
import 'package:todo_list_app/views/edit_task_view.dart';
import 'package:todo_list_app/widgets/all_task_card_widget.dart';

class AllTasksView extends StatelessWidget {
  const AllTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD6D7EF),
        appBar: AppBar(
          title: const Text(
            'TODO APP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Jost',
              color: Color(0xFFFFFFFF),
            ),
          ),
          backgroundColor: const Color(0xFF9395D3),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_today,
                  size: 30,
                  color: Color(0xFFFFFFFF),
                ))
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<TaskProvider>(
            builder: (context, task, child) {
              return ListView.builder(
                itemCount: task.uncompletedTasks.length,
                itemBuilder: (context, index) {
                  return AllTaskCardWidget(
                    task: task.uncompletedTasks[index],
                    onComplete: () {
                      task.markTaskAsCompleted(index);
                    },
                    onEdit: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            EditTaskView(task: task.uncompletedTasks[index]),
                      ));
                    },
                    onDelete: () => task.deleteTask(index),
                  );
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF9395D3),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskView(),
                ));
          },
          child: const Icon(Icons.add, color: Color(0xFFFFFFFF)),
        ));
  }
}
