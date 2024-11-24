class UserModel {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String image;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.image,
  });

  // Static function to create an empty UserModel
  static UserModel empty() => UserModel(
        name: "",
        email: "",
        address: "",
        phone: "",
        image: "",
      );

  // Convert model to JSON structure
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'image': image,
    };
  }

  // Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      phone: json["phone"] ?? "",
      image: json["image"] ?? "",
    );
  }
}
