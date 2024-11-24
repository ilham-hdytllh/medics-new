class EventModel {
  final int id;
  final String title;
  final String image;
  final String dateOfEvent;
  final String location;
  final String? description;

  EventModel({
    required this.id,
    required this.title,
    required this.image,
    required this.dateOfEvent,
    required this.location,
    this.description,
  });

  static EventModel empty() => EventModel(
      id: 0,
      title: "",
      image: "",
      dateOfEvent: "",
      location: "",
      description: "");

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'date_of_event': dateOfEvent,
      'location': location,
      'description': description,
    };
  }

  // Factory method to create an EventModel from JSON
  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      image: json["image"] ?? "",
      dateOfEvent: json["date_of_event"] ?? "",
      location: json["location"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
