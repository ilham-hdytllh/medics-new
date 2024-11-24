class Answer {
  int id;
  int questionHeaderId;
  String title;
  int sortOrder;
  int status;
  String createdAt;
  String updatedAt;

  Answer({
    required this.id,
    required this.questionHeaderId,
    required this.title,
    required this.sortOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        questionHeaderId: json["question_header_id"],
        title: json["title"],
        sortOrder: json["sort_order"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_header_id": questionHeaderId,
        "title": title,
        "sort_order": sortOrder,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
