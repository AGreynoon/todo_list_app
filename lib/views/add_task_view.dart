import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/providers/task_provider.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      if (_formKey.currentState!.validate()) {
                        final newTask = TaskModel(
                          title: titleController.text,
                          detail: detailController.text,
                        );
                        context.read<TaskProvider>().addTask(newTask);
                        titleController.clear();
                        detailController.clear();
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
