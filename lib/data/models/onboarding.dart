class OnBoardingModel {
  final int id;
  final String title;
  final String image;
  final String url;
  final int sortOrder;
  final String createdAt;
  final String updatedAt;

  OnBoardingModel({
    required this.id,
    required this.title,
    required this.image,
    required this.url,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      url: json['url'] ?? "",
      sortOrder: json['sort_order'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'url': url,
      'sort_order': sortOrder,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
