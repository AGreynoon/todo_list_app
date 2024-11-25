import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class CompletedTaskcard extends StatelessWidget {
  final Task task;
  const CompletedTaskcard({
    required this.task,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        height: 80,
        child: Card(
          color: const Color(0xFFFFFFFF),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              task.title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Jost',
                color: Color(0xFF9395D3),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              task.detail,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Jost',
                color: Color(0xFF000000),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
