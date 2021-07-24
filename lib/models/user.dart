class User {
  final String id;
  final String displayName;
  final String email;
  final String profileImage;

  User({required this.id, required  this.displayName, required this.email, required this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      displayName: json['displayName'],
      email: json['email'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'displayName' : displayName,
      'email' : email,
      'profileImage' : profileImage,
    };
  }
}