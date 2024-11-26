import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class AddTask extends StatefulWidget {
  final Function(Task) onSave;
  const AddTask({required this.onSave, super.key});

  @override
  State<AddTask> createState() {
    debugPrint('AddTask createState runs');
    return _AddtaskState();
  }
}

class _AddtaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  void dispose() {
    debugPrint('AddTask dispose runs');
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('AddTask build runs');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Jost',
            color: Color(0xFFFFFFFF),
          ),
        ),
        backgroundColor: const Color(0xFF9395D3),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF9395D3),
                      )),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: detailController,
                  decoration: const InputDecoration(
                    hintText: 'Details',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF9395D3),
                    ),
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some Detials';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9395D3),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 6,
                      minimumSize: const Size(380, 65),
                    ),
                    onPressed: () {
                      debugPrint('AddTask ElevatedButton runs');
                      if (_formKey.currentState!.validate()) {
                        final newTask = Task(
                          title: titleController.text,
                          detail: detailController.text,
                        );
                        widget.onSave(newTask);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Jost',
                        color: Color(0xFFFFFFFF),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
