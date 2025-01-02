class TaskModel {
  String title;
  String detail;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.detail,
    this.isCompleted = false,
  });
}
