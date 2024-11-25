import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/views/add_task.dart';
import 'package:todo_list_app/views/edit_task.dart';
import 'package:todo_list_app/widgets/all_task_card.dart';

class AllTasks extends StatefulWidget {
  final TaskManager taskManager;
  const AllTasks({required this.taskManager, super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        body: ListView.builder(
          itemCount: widget.taskManager.uncompletedTasks.length,
          itemBuilder: (context, index) {
            return AllTaskcard(
              task: widget.taskManager.uncompletedTasks[index],
              onComplete: () {
                setState(() {
                  widget.taskManager.markTaskAsCompleted(index);
                });
              },
              onEdit: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditTask(
                        task: widget.taskManager.uncompletedTasks[index],
                        onChange: (updatedTask) {
                          setState(() {
                            widget.taskManager.updateTask(index, updatedTask);
                          });
                        }),
                  ));
                });
              },
              onDelete: () {
                setState(() {
                  widget.taskManager.deleteTask(index);
                });
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
                  builder: (context) => AddTask(
                    onSave: (newTask) {
                      setState(() {
                        widget.taskManager.addTask(newTask);
                      });
                    },
                  ),
                ));
          },
          child: const Icon(Icons.add, color: Color(0xFFFFFFFF)),
        ));
  }
}
