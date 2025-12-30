// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

List<Questions> questionsFromJson(String str) => List<Questions>.from(json.decode(str).map((x) => Questions.fromJson(x)));

String questionsToJson(List<Questions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Questions {
    int id;
    int activityId;
    String level;
    String? imageUrl;
    String question;
    List<String>? options;
    String? answer;
    String type;
    DateTime createdAt;
    DateTime updatedAt;
    Activity? activity;

    Questions({
        required this.id,
        required this.activityId,
        required this.level,
        required this.imageUrl,
        required this.question,
        required this.options,
        required this.answer,
        required this.type,
        required this.createdAt,
        required this.updatedAt,
        this.activity,
    });

    factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        id: json["id"],
        activityId: json["activity_id"],
        level: json["level"],
        imageUrl: json["image_url"],
        question: json["question"],
        options: json["options"] == null ? null : List<String>.from(json["options"]!.map((x) => x)),
        answer: json["answer"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        activity: json['activity'] == null ? null : Activity.fromJson(json['activity']),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "activity_id": activityId,
        "level": level,
        "image_url": imageUrl,
        "question": question,
        "options": options == null ? null : List<dynamic>.from(options!.map((x) => x)),
        "answer": answer,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "activity": activity?.toJson(),
    };
}

class Activity {
    int id;
    String name;
    String code;
    dynamic createdAt;
    dynamic updatedAt;

    Activity({
        required this.id,
        required this.name,
        required this.code,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}
