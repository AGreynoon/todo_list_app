class TaskModel {
  String title;
  String detail;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.detail,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? title,
    String? detail,
    bool? isCompleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      detail: detail ?? this.detail,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
