import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/views/add_task.dart';
import 'package:todo_list_app/views/edit_task.dart';
import 'package:todo_list_app/widgets/all_task_card.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

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
        body: Consumer<TaskManager>(
          builder: (context, task, child) {
            return ListView.builder(
              itemCount: task.uncompletedTasks.length,
              itemBuilder: (context, index) {
                return AllTaskcard(
                  task: task.uncompletedTasks[index],
                  onComplete: () {
                    task.markTaskAsCompleted(index);
                  },
                  onEdit: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          EditTask(task: task.uncompletedTasks[index]),
                    ));
                  },
                  onDelete: () => task.deleteTask(index),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF9395D3),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(),
                ));
          },
          child: const Icon(Icons.add, color: Color(0xFFFFFFFF)),
        ));
  }
}
