import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO APP'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_today,
                size: 30,
              ))
        ],
        elevation: 0,
      ),
      body: null,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
