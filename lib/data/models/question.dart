import 'package:medics/data/models/answer.dart';

class QuestionModel {
  int id;
  int questionCategoryId;
  String title;
  int sortOrder;
  int status;
  String createdAt;
  String updatedAt;
  List<Answer> answers;

  QuestionModel({
    required this.id,
    required this.questionCategoryId,
    required this.title,
    required this.sortOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        questionCategoryId: json["question_category_id"],
        title: json["title"],
        sortOrder: json["sort_order"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        answers: List<Answer>.from(
            json["answers"].map((answer) => Answer.fromJson(answer))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_category_id": questionCategoryId,
        "title": title,
        "sort_order": sortOrder,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "answers": List<dynamic>.from(
            answers.map((answer) => answer.toJson())), // Perbaikan di sini
      };
}
