import 'package:flutter/material.dart';

class Taskcard extends StatelessWidget {
  const Taskcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        height: 80,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: const Text(
              '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: const Text(
              '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.check_outlined)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
