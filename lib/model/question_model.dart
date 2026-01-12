class Questions {
  int id;
  int activityId;
  String level;
  String? imageUrl;
  String question;
  List<String>? options;
  String? answer;
  String type;

  Questions({
    required this.id,
    required this.activityId,
    required this.level,
    required this.imageUrl,
    required this.question,
    required this.options,
    required this.answer,
    required this.type,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        id: json["id"],
        activityId: json["activity_id"],
        level: json["level"],
        imageUrl: json["image_url"],
        question: json["question"],
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"]),
        answer: json["answer"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_id": activityId,
        "level": level,
        "image_url": imageUrl,
        "question": question,
        "options": options,
        "answer": answer,
        "type": type,
      };
}
