import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/models/task_model.dart';
import 'package:todo_list_app/providers/task_provider.dart';

class EditTaskView extends ConsumerStatefulWidget {
  final TaskModel taskModel;
  const EditTaskView({required this.taskModel, super.key});

  @override
  ConsumerState<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends ConsumerState<EditTaskView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController detailController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.taskModel.title);
    detailController = TextEditingController(text: widget.taskModel.detail);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskState = ref.read(taskNotifierProvider.notifier);
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
                            taskState.updateTask(widget.taskModel.title,
                                newTitle: titleController.text,
                                newDetail: detailController.text);
                            Navigator.pop(context);
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
                      onPressed: () => Navigator.of(context).pop(),
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
