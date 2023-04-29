class UserModel {

  String? id;
  String name;
  String email;
  String? image;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromMap(String id, Map<String, dynamic> map) {
    return UserModel(
      id: id,
      name: map['name'] as String,
      email: map['email'] as String,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, image: $image)';
  }
}
