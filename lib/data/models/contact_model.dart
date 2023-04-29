class ContactModel {

  String? id;
  String userId;
  String name;
  String dni;

  ContactModel({
    this.id,
    required this.userId,
    required this.name,
    required this.dni,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'dni': dni,
      'createDate': DateTime.now()
    };
  }

  factory ContactModel.fromMap(String id, Map<String, dynamic> map) {
    return ContactModel(
      id: id,
      userId: map['userId'] as String,
      name: map['name'] as String,
      dni: map['dni'] as String,
    );
  }

  @override
  String toString() => 'ContactModel(id: $id, name: $name, dni: $dni)';
}
