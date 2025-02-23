import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/providers/task_provider.dart';

class AddTaskView extends ConsumerStatefulWidget {
  const AddTaskView({super.key});

  @override
  ConsumerState<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends ConsumerState<AddTaskView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

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
                        taskState.addTask(
                            titleController.text, detailController.text);
                        Navigator.pop(context);
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
