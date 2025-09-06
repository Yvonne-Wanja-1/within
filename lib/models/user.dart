class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final Map<String, dynamic> preferences;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    required this.preferences,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileImage: json['profileImage'] as String?,
      preferences: json['preferences'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'preferences': preferences,
    };
  }
}
