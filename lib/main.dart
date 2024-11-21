import 'package:flutter/material.dart';
import 'package:todo_list_app/themes/appTheme.dart';
import 'package:todo_list_app/views/completedTask.dart';
import 'package:todo_list_app/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'All'),
              NavigationDestination(
                  icon: Icon(
                    Icons.done,
                  ),
                  label: 'Completed'),
            ]),
        body: [
          const Home(),
          const CompletedTask(),
        ][currentPageIndex],
      ),
    );
  }
}
