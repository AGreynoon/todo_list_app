import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/views/add_task.dart';
import 'package:todo_list_app/views/edit_task.dart';
import 'package:todo_list_app/widgets/all_task_card.dart';

class AllTasks extends StatefulWidget {
  final TaskManager taskManager;
  const AllTasks({required this.taskManager, super.key});

  @override
  State<AllTasks> createState() {
    debugPrint('AllTasks createState runs');
    return _AllTasksState();
  }
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    debugPrint('AllTasks build runs');
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
                  debugPrint('Task marks as complete');
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
                            debugPrint('Task has updated');
                            widget.taskManager.updateTask(index, updatedTask);
                          });
                        }),
                  ));
                });
              },
              onDelete: () {
                setState(() {
                  debugPrint('Task has deleted');
                  widget.taskManager.deleteTask(index);
                });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF9395D3),
          onPressed: () {
            debugPrint('AllTasks floatingActionButton runs');
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(
                    onSave: (newTask) {
                      setState(() {
                        debugPrint('NewTask was added');
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
