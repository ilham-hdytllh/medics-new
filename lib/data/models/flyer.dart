class FlyerModel {
  final int id;
  final String title;
  final String image;
  final String type;
  final String url;
  final int sortOrder;

  FlyerModel({
    required this.id,
    required this.title,
    required this.image,
    required this.type,
    required this.url,
    required this.sortOrder,
  });

  static FlyerModel empty() => FlyerModel(
        id: 0,
        title: "",
        image: "",
        type: "",
        url: "",
        sortOrder: 0,
      );

  // Convert model to JSON structure
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'type': type,
      'url': url,
      'sort_order': sortOrder,
    };
  }

  // Factory method to create a FlyerModel from JSON
  factory FlyerModel.fromJson(Map<String, dynamic> json) {
    return FlyerModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      type: json["type"] ?? "",
      url: json["url"] ?? "",
      sortOrder: json["sort_order"] ?? 0,
    );
  }
}
