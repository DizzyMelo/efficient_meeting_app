import 'topic_entity.dart';

class Meeting {
  Meeting({
    this.id,
    this.title,
    this.description,
    this.date,
    this.host,
    this.duration,
    this.topics,
    this.participants,
    this.status,
    this.v,
  });

  String? id;
  String? title;
  String? description;
  DateTime? date;
  String? host;
  int? duration;
  List<Topic>? topics;
  List<String>? participants;
  String? status;
  int? v;

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        host: json["host"],
        duration: json["duration"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
        participants: List<String>.from(json["participants"].map((x) => x)),
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "date": date == null ? null : date!.toIso8601String(),
        "host": host,
        "duration": duration,
        "topics": List<dynamic>.from(topics!.map((x) => x.toJson())),
        "participants": List<dynamic>.from(participants!.map((x) => x)),
        "status": status,
        "__v": v,
      };
}
