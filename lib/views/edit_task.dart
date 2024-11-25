import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';

class EditTask extends StatefulWidget {
  final Function(Task) onChange;
  final Task task;
  const EditTask({required this.onChange, required this.task, super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF9395D3),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          elevation: 6,
                          minimumSize: const Size(170, 65),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              final updateTask = Task(
                                title: titleController.text,
                                detail: detailController.text,
                              );
                              widget.onChange(updateTask);
                              Navigator.of(context).pop();
                              titleController.clear();
                              detailController.clear();
                            });
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFFFFFFF)),
                        )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9395D3),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 6,
                        minimumSize: const Size(170, 65),
                      ),
                      onPressed: () {
                        titleController.clear();
                        detailController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFFFFFFFF)),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}