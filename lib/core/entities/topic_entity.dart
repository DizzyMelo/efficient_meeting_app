class Topic {
  Topic({
    this.name,
    this.completed,
    this.id,
  });

  String? name;
  bool? completed;
  String? id;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        name: json["name"],
        completed: json["completed"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "completed": completed,
        "_id": id,
      };
}
