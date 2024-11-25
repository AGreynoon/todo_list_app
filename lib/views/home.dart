import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_manager.dart';
import 'package:todo_list_app/views/all_tasks.dart';
import 'package:todo_list_app/views/completed_task.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TaskManager taskManager;

  @override
  void initState() {
    super.initState();
    taskManager = TaskManager();
    taskManager.uncompletedTasks;
    taskManager.completedTasks;
  }

  List<Widget> get pages => [
        AllTasks(taskManager: taskManager),
        CompletedTask(taskManager: taskManager),
      ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6D7EF),
      body: pages.elementAt(currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: const Color(0xFFFFFFFF),
          currentIndex: currentPageIndex,
          selectedItemColor: const Color(0xFF9395D3),
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF8B8787),
              icon: Icon(
                Icons.menu,
              ),
              label: 'All',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF8B8787),
              icon: Icon(
                Icons.done,
              ),
              label: 'Completed',
            ),
          ]),
    );
  }
}
