class TaskDataEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? hexColor;
  final String? uid;
  final DateTime? dueAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TaskDataEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.hexColor,
    required this.uid,
    required this.dueAt,
    required this.createdAt,
    required this.updatedAt,
  });
}
