class AdminModel {
  final int? id;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String answer;
  final String level;

  AdminModel({
    this.id,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.answer,
    required this.level,
  });

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'],
      question: map['question'],
      optionA: map['optionA'],
      optionB: map['optionB'],
      optionC: map['optionC'],
      answer: map['answer'],
      level: map['level'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'optionA': optionA,
      'optionB': optionB,
      'optionC': optionC,
      'answer': answer,
      'level': level,
    };
  }
}
