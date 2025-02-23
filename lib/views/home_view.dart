import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/pages_provider.dart';
import 'package:todo_list_app/views/all_tasks_view.dart';
import 'package:todo_list_app/views/completed_task_view.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  List<Widget> get pages => [
        const AllTasksView(),
        const CompletedTaskView(),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(pagesNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFD6D7EF),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            ref.read(pagesNotifierProvider.notifier).setIndex(index);
          },
          currentIndex: selectedIndex,
          backgroundColor: const Color(0xFFFFFFFF),
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
