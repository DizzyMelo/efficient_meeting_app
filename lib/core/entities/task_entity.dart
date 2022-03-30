class Task {
  Task({
    this.id,
    this.title,
    this.description,
    this.createdBy,
    this.assignedTo,
    this.deadLine,
    this.completed,
  });

  String? id;
  String? title;
  String? description;
  String? createdBy;
  String? assignedTo;
  DateTime? deadLine;
  bool? completed;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        createdBy: json["createdBy"],
        assignedTo: json["assignedTo"],
        deadLine: DateTime.parse(json["deadLine"]),
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "createdBy": createdBy,
        "assignedTo": assignedTo,
        "deadLine": deadLine!.toIso8601String(),
        "completed": completed,
      };
}
