class NewsModel {
  final int id;
  final String title;
  final String image;
  final String publishedAt;
  final String? description;

  NewsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.publishedAt,
    this.description,
  });

  // Static function to create an empty NewsModel
  static NewsModel empty() =>
      NewsModel(id: 0, title: "", image: "", publishedAt: "", description: "");

  // Convert model to JSON structure
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'published_at': publishedAt,
      'description': description
    };
  }

  // Factory method to create a NewsModel from JSON
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      publishedAt: json["published_at"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
