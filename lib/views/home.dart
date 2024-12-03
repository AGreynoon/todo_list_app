import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/pages_provider.dart';
import 'package:todo_list_app/views/all_tasks.dart';
import 'package:todo_list_app/views/completed_task.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  List<Widget> get pages => [
        const AllTasks(),
        const CompletedTask(),
      ];

  @override
  Widget build(BuildContext context) {
    final pagesProvider = Provider.of<PagesProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFD6D7EF),
      body: pages.elementAt(pagesProvider.currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            pagesProvider.updatePage(index);
          },
          backgroundColor: const Color(0xFFFFFFFF),
          currentIndex: pagesProvider.currentPageIndex,
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
